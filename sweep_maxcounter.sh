## naming convention is pp2_(tblsize)_(str)_(thresh)_(victqueuesize)_(push zeroes)

g++ -Wall --std=c++11 -o pp2_512_2_1_8_0 percepts/pp2_512_2_1_8_0.cpp lib/config1.a

./pp2_512_2_1_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_2_1_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_2_1_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_2_1_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_2_1_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_4_2_8_0 percepts/pp2_512_4_2_8_0.cpp lib/config1.a

./pp2_512_4_2_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_4_2_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_4_2_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_4_2_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_4_2_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_4_8_0 percepts/pp2_512_8_4_8_0.cpp lib/config1.a

./pp2_512_8_4_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_4_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_4_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_4_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_4_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_16_8_8_0 percepts/pp2_512_16_8_8_0.cpp lib/config1.a

./pp2_512_16_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_16_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_16_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_16_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_16_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_32_16_8_0 percepts/pp2_512_32_16_8_0.cpp lib/config1.a

./pp2_512_32_16_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_32_16_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_32_16_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_32_16_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_32_16_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz
