PROJECT = non_mutating_algorithms.gpr

# timeout for chapter
NON_MUTATING_DEFAULT_TIMEOUT = "TIMEOUT=5"

# level for each function
LEVEL_NAIVE_FIND    = 0
LEVEL_NAIVE_FIND_PB = 4
LEVEL_FIND          = 0

include ../Makefile

.PHONY: naive_find naive_find_contract_pb find

naive_find: $(call GENERATE_DEP,naive_find)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_NAIVE_FIND) $(NON_MUTATING_DEFAULT_TIMEOUT)

naive_find_contract_pb: naive_find_contract_pb.ads
	make prove FILE=$^ LEVEL=$(LEVEL_NAIVE_FIND_PB) $(NON_MUTATING_DEFAULT_TIMEOUT)

find: $(call GENERATE_DEP,find) ../spec/has_value_p.ads
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_FIND) $(NON_MUTATING_DEFAULT_TIMEOUT)
