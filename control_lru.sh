## naming convention is pp2_(tblsize)_(str)_(thresh)_(victqueuesize)_(push zeroes)

g++ -Wall --std=c++11 -o lru-control example/lru.cc lib/config1.a

./lru-control -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./lru-control -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./lru-control -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./lru-control -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./lru-control -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

