## naming convention is pp2_(tblsize)_(str)_(thresh)_(victqueuesize)_(push zeroes)

g++ -Wall --std=c++11 -o pp2_128_8_8_8_0 percepts/pp2_128_8_8_8_0.cpp lib/config1.a

./pp2_128_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_128_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_128_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_128_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_128_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_256_8_8_8_0 percepts/pp2_256_8_8_8_0.cpp lib/config1.a

./pp2_256_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_256_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_256_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_256_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_256_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_8_8_0 percepts/pp2_512_8_8_8_0.cpp lib/config1.a

./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_1024_8_8_8_0 percepts/pp2_1024_8_8_8_0.cpp lib/config1.a

./pp2_1024_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_1024_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_1024_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_1024_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_1024_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_2048_8_8_8_0 percepts/pp2_2048_8_8_8_0.cpp lib/config1.a

./pp2_2048_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_2048_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_2048_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_2048_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_2048_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz
