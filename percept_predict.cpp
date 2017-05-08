#include "../inc/champsim_crc2.h"

#define NUM_CORE 1
#define LLC_SETS NUM_CORE*2048
#define LLC_WAYS 16
#define TBLSIZE 512
#define MAX_CTR 8
#define THRESH 4

uint32_t lru[LLC_SETS][LLC_WAYS];
bool zeroReuse[LLC_SETS][LLC_WAYS];
int32_t predictions[LLC_SETS][LLC_WAYS];
int feat1[TBLSIZE];


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
    }

    for (int i=0; i < TBLSIZE; i++) {
    	feat1[TBLSIZE] = 0 ;
    }
}

void updateTables(bool reused, int tableInd) {
	if (!reused && feat1[tableInd] > (0-MAX_CTR)) {
		feat1[tableInd]--;
    }
    else if (reused && feat1[tableInd] < MAX_CTR) {
    	feat1[tableInd]++;
    }

}

int getInsertPos(int tableInd) {
	if (feat1[tableInd] < (0-THRESH))
		return -1;
	else if (feat1[tableInd > THRESH])
		return 1;
	else 
		return 0;
}

// find replacement victim
// return value should be 0 ~ 15 or 16 (bypass)
uint32_t GetVictimInSet (uint32_t cpu, uint32_t set, const BLOCK *current_set, uint64_t PC, uint64_t paddr, uint32_t type)
{
    uint32_t lruInd = 0;
    for (int i=0; i<LLC_WAYS; i++)
        if (lru[set][i] == (LLC_WAYS-1))
            lruInd = i;
            
    updateTables(lruInd);
    return lruInd;
}

// called on every cache hit and cache fill
void UpdateReplacementState (uint32_t cpu, uint32_t set, uint32_t way, uint64_t paddr, uint64_t PC, uint64_t victim_addr, uint32_t type, uint8_t hit)
{
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
        uint32_t hashVal = (paddr >> 6) % TBLSIZE;
        int prediction = getInsertPos(hashVal);
        predictions[set][way] = prediction;
        int insertPos = 0;
        if (prediction = -1)
        	insertPos = LLC_WAYS - 1;
        else if (prediction = 0)
        	insertPos = LLC_WAYS / 2;
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