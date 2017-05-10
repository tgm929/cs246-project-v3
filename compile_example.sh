g++ -Wall --std=c++11 -o percep-c1 example/percept_predict.cpp lib/config1.a

./percep-c1 -warmup_instructions 1000000 -simulation_instructions 10000000 -traces trace/bzip2_10M.trace.gz