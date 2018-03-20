PROJECT = non_mutating_algorithms.gpr

# timeout for chapter
NON_MUTATING_DEFAULT_TIMEOUT = "TIMEOUT=5"

# specification dependencies for each function
SPEC_TYPES          = ../spec/types.ads
SPEC_FIND           = ../spec/has_value_p.ads $(SPEC_TYPES)
SPEC_FIND_FIRST_OF  = $(SPEC_FIND) ../spec/has_value_of_p.ads
SPEC_ADJACENT_FIND  = ../spec/has_equal_neighbors_p.ads $(SPEC_TYPES)
SPEC_EQUAL_MISMATCH = ../spec/equal_ranges_p.ads $(SPEC_TYPES)

# level for each function
LEVEL_NAIVE_FIND    = 0
LEVEL_NAIVE_FIND_PB = 4
LEVEL_FIND          = 0
LEVEL_FIND_FIRST_OF = 0
LEVEL_ADJACENT_FIND = 0
LEVEL_MISMATCH      = 1
LEVEL_EQUAL         = 1
LEVEL_EQUAL_REV     = 1

include ../Makefile

.PHONY: naive_find naive_find_contract_pb find find_first_of adjacent_find \
	mismatch

# Find
naive_find: $(call GENERATE_DEP,naive_find)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_NAIVE_FIND) $(NON_MUTATING_DEFAULT_TIMEOUT)

naive_find_contract_pb: naive_find_contract_pb.ads
	make prove FILE=$^ LEVEL=$(LEVEL_NAIVE_FIND_PB) $(NON_MUTATING_DEFAULT_TIMEOUT)

find: $(call GENERATE_DEP,find) $(SPEC_FIND)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_FIND) $(NON_MUTATING_DEFAULT_TIMEOUT)

# Find_First_Of
find_first_of: $(call GENERATE_DEP,find_first_of) $(SPEC_FIND_FIRST_OF)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_FIND_FIRST_OF) $(NON_MUTATING_DEFAULT_TIMEOUT)

# Adjacent_Find
adjacent_find: $(call GENERATE_DEP,adjacent_find) $(SPEC_ADJACENT_FIND)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ADJACENT_FIND) $(NON_MUTATING_DEFAULT_TIMEOUT)

# Equal and Mismatch
mismatch: $(call GENERATE_DEP,mismatch) $(SPEC_MISMATCH)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MISMATCH) $(NON_MUTATING_DEFAULT_TIMEOUT)

equal: $(call GENERATE_DEP,equal) $(SPEC_MISMATCH)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_EQUAL) $(NON_MUTATING_DEFAULT_TIMEOUT)

equal_rev: equal_rev_p.ads $(SPEC_MISMATCH)
	make prove FILE=equal_rev_p.ads LEVEL=$(LEVEL_EQUAL_REV) $(NON_MUTATING_DEFAULT_TIMEOUT)
