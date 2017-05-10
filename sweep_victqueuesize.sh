g++ -Wall --std=c++11 -o pp2_512_8_8_1_0 percepts/pp2_512_8_8_1_0.cpp lib/config1.a

./pp2_512_8_8_1_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_1_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_1_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_1_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_1_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_8_2_0 percepts/pp2_512_8_8_2_0.cpp lib/config1.a

./pp2_512_8_8_2_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_2_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_2_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_2_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_2_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_8_4_0 percepts/pp2_512_8_8_4_0.cpp lib/config1.a

./pp2_512_8_8_4_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_4_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_4_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_4_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_4_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_8_8_0 percepts/pp2_512_8_8_8_0.cpp lib/config1.a

./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_8_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz

g++ -Wall --std=c++11 -o pp2_512_8_8_8_0 percepts/pp2_512_8_8_16_0.cpp lib/config1.a

./pp2_512_8_8_16_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz
./pp2_512_8_8_16_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/graph_analytics_10M.trace.gz
./pp2_512_8_8_16_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/libquantum_10M.trace.gz
./pp2_512_8_8_16_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/mcf_10M.trace.gz
./pp2_512_8_8_16_0 -warmup_instructions 2000000 -simulation_instructions 10000000 -traces trace/xalancbmk_10M.trace.gz
