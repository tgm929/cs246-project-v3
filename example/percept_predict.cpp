#include "../inc/champsim_crc2.h"

#define NUM_CORE 1
#define LLC_SETS NUM_CORE*2048
#define LLC_WAYS 16
#define TBLSIZE 512
#define MAX_CTR 8
#define THRESH 4
#define VICTIM_QUEUE_SIZE LLC_WAYS/4
#define PCi_SIZE 3

uint32_t lru[LLC_SETS][LLC_WAYS];
bool zeroReuse[LLC_SETS][LLC_WAYS];
int32_t predictions[LLC_SETS][LLC_WAYS];
int feat1[TBLSIZE];
int feat2[TBLSIZE];
int feat3[TBLSIZE];
int PCi[PCi_SIZE];

struct victqueue_entry
{
    uint32_t tag;
    int pos;
    uint32_t hash1;
    uint32_t hash2;
    uint32_t hash3;
};

victqueue_entry vict_queue[LLC_SETS][VICTIM_QUEUE_SIZE];


// initialize replacement state
void InitReplacementState()
{
    cout << "Initialize LRU replacement state" << endl;

    for (int i=0; i<LLC_SETS; i++) {
        for (int j=0; j<LLC_WAYS; j++) {
            lru[i][j] = j;
            zeroReuse[i][j] = true;
            predictions[i][j] = 0;
        }
        for (int j=0; j<VICTIM_QUEUE_SIZE; j++) {
            vict_queue[i][j].tag = 0;
            vict_queue[i][j].pos = 0;
            vict_queue[i][j].hash1 = 0;
            vict_queue[i][j].hash2 = 0;
            vict_queue[i][j].hash3 = 0;
        }

    }

    for (int i=0; i < TBLSIZE; i++) {
    	feat1[TBLSIZE] = 0;
        feat2[TBLSIZE] = 0;
        feat3[TBLSIZE] = 0;
    }

    for (int i=0; i < PCi_SIZE; i++) {
        PCi[i] = 0;
    }
}

/*void updateTables(bool reused, int tableInd) {
	if (!reused && feat1[tableInd] > (0-MAX_CTR)) {
		feat1[tableInd]--;
    }
    else if (reused && feat1[tableInd] < MAX_CTR) {
    	feat1[tableInd]++;
    }

}*/

// updates PCi
void updatePCi(uint64_t PC) {
    for (int i = 0; i < PCi_SIZE - 1; i++) {
        PCi[i + 1] = PCi[i];
    }
    PCi[0] = PC;
}

// returns the XOR of all PCi
uint64_t getXOR_PCi() {
    uint64_t result = 0;
    for (int i = 0; i < PCi_SIZE; i++) {
        result =  result ^ PCi[i];
    }
    return result;
}

// train
void updateTables(bool inc, int index1, int index2, int index3) {
        if (inc) {
            feat1[index1]++;
            feat2[index2]++;
            feat3[index3]++;
        }
        else {
            feat1[index1]--;
            feat2[index2]--;
            feat3[index3]--;
        }
}

// predict
int getInsertPos(int index1, int index2, int index3) {
    int sum = feat1[index1] + feat2[index2] + feat3[index3];
	if (sum < (0-THRESH))
		return -1;
	else if (sum > THRESH)
		return 1;
	else 
		return 0;
}

// check match in vicitim queue
bool checkVictQueue (uint32_t set, uint32_t tag) {
    for (int i = 0; i < VICTIM_QUEUE_SIZE; i++) {
        if (vict_queue[set][i].tag == tag)
            return true;
    }
    return false;
}

// insert victim into queue and push other entries down 1
void updateVictQueue (uint32_t set, uint32_t tag, int hv1, int hv2, int hv3) {
    for (int i = 0; i < VICTIM_QUEUE_SIZE; i++) {
        if (vict_queue[set][i].pos < (VICTIM_QUEUE_SIZE - 1)) {
            vict_queue[set][i].pos++;
        }
        else {
            vict_queue[set][i].pos = 0;
            vict_queue[set][i].tag = tag;
            vict_queue[set][i].hash1 = hv1;
            vict_queue[set][i].hash2 = hv2;
            vict_queue[set][i].hash3 = hv3;
        }
    }
}


// find replacement victim
// return value should be 0 ~ 15 or 16 (bypass)
// training called here
uint32_t GetVictimInSet (uint32_t cpu, uint32_t set, const BLOCK *current_set, uint64_t PC, uint64_t paddr, uint32_t type)
{
    // find victim
    uint32_t lruInd = 0;
    for (int i=0; i<LLC_WAYS; i++)
        if (lru[set][i] == (LLC_WAYS-1))
            lruInd = i;
    
    // hash functions
    uint32_t hv1 = (paddr >> 6) % TBLSIZE;
    uint32_t hv2 = (PC >> 2) % TBLSIZE;
    uint32_t hv3 = (getXOR_PCi() >> 2) % TBLSIZE;

    // training and victim queue management
    // if not reused
    if (zeroReuse[set][lruInd]) {
        if (predictions[set][lruInd] == 1) {
            updateTables(false, hv1, hv2, hv3);
            // updateVictQueue (0, 0, 0, 0, 0);
        }
        else if (predictions[set][lruInd] == 0) {
            updateTables(false, hv1, hv2, hv3);
        }
        else {
            updateVictQueue(set, current_set->tag, hv1, hv2, hv3);
        }
    }
    // if reused and predicted 0 or -1
    else if (predictions[set][lruInd] == 0 || predictions[set][lruInd] == -1) {
            updateTables(true, hv1, hv2, hv3);
    }

    return lruInd;
}

// called on every cache hit and cache fill
void UpdateReplacementState (uint32_t cpu, uint32_t set, uint32_t way, uint64_t paddr, uint64_t PC, uint64_t victim_addr, uint32_t type, uint8_t hit)
{
    // update PCi
    updatePCi(PC);

    // update lru replacement state
    // if its a hit, update the lru as normal
    if (hit) {
	    for (uint32_t i=0; i<LLC_WAYS; i++) {
	        if (lru[set][i] < lru[set][way]) {
	            lru[set][i]++;

	            if (lru[set][i] == LLC_WAYS)
	                assert(0);
	        }
	    }
	    lru[set][way] = 0; // promote to the MRU position
	    zeroReuse[set][way] = false;
	}
        // if new insertion, choose where to insert the new block
    else {
        uint32_t hv1 = (paddr >> 6) % TBLSIZE;
        uint32_t hv2 = (PC >> 2) % TBLSIZE;
        uint32_t hv3 = (getXOR_PCi() >> 2) % TBLSIZE;
        int prediction = getInsertPos(hv1, hv2, hv3);
        predictions[set][way] = prediction;
        uint32_t insertPos = 0;
        if (prediction == -1)
        	insertPos = LLC_WAYS - 1;
        else if (prediction == 0)
        	insertPos = (LLC_WAYS / 2) - 1;
        else
        	insertPos = 0;
        for (uint32_t i=0; i < LLC_WAYS; i++) {
        	if (lru[set][i] >= insertPos)
        		lru[set][i]++;
        }
        lru[set][way] = insertPos;
        zeroReuse[set][way] = true;
    }
}

// use this function to print out your own stats on every heartbeat 
void PrintStats_Heartbeat()
{

}

// use this function to print out your own stats at the end of simulation
void PrintStats()
{

}