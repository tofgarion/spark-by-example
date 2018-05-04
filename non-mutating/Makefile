PROJECT = non_mutating_algorithms.gpr

# timeout for chapter
NON_MUTATING_DEFAULT_TIMEOUT = "TIMEOUT=5"

# specification dependencies for each function
SPEC_TYPES             = ../spec/types.ads
SPEC_FIND              = ../spec/has_value_p.ads $(SPEC_TYPES)
SPEC_FIND_FIRST_OF     = $(SPEC_FIND) ../spec/has_value_of_p.ads
SPEC_ADJACENT_FIND     = ../spec/has_equal_neighbors_p.ads $(SPEC_TYPES)
SPEC_EQUAL_MISMATCH    = ../spec/equal_ranges_p.ads $(SPEC_TYPES)
SPEC_SEARCH_WO_GHOST   = $(SPEC_TYPES)
SPEC_SEARCH_WITH_GHOST = $(SPEC_TYPES)
SPEC_SEARCH            = ../spec/has_subrange_p.ads $(SPEC_TYPES)
SPEC_SEARCH_N          = ../spec/has_constant_subrange_p.ads $(SPEC_TYPES)
SPEC_FIND_END          = ../spec/has_subrange_p.ads $(SPEC_TYPES)
SPEC_COUNT             = ../spec/occ_p.ads $(SPEC_TYPES)

# level for each function
LEVEL_NAIVE_FIND        = 0
LEVEL_NAIVE_FIND_PB     = 4
LEVEL_FIND              = 0
LEVEL_FIND_FIRST_OF     = 0
LEVEL_ADJACENT_FIND     = 0
LEVEL_MISMATCH          = 1
LEVEL_EQUAL             = 1
LEVEL_EQUAL_REV         = 1
LEVEL_SEARCH_WO_GHOST   = 4
LEVEL_SEARCH_WITH_GHOST = 4
LEVEL_SEARCH            = 1
LEVEL_SEARCH_N          = 1
LEVEL_FIND_END          = 1
LEVEL_COUNT             = 0

# specific timeouts
TIMEOUT_SEARCH_WO_GHOST   = "TIMEOUT=5"
TIMEOUT_SEARCH_WITH_GHOST = "TIMEOUT=5"
TIMEOUT_SEARCH            = "TIMEOUT=30"

# all proof targets
ALL_PROOF_TARGETS = naive_find naive_find_contract_pb find find_first_of adjacent_find \
		mismatch equal equal_rev search_wo_ghost search_with_ghost search \
		search_n find_end count

include ../Makefile-common

.PHONY:

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

# Search
search_wo_ghost: $(call GENERATE_DEP,search_wo_ghost) $(SPEC_SEARCH_WO_GHOST)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH_WO_GHOST) $(TIMEOUT_SEARCH_WO_GHOST)

search_with_ghost: $(call GENERATE_DEP,search_with_ghost) $(SPEC_SEARCH_WO_GHOST)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH_WITH_GHOST) $(TIMEOUT_SEARCH_WITH_GHOST)

search: $(call GENERATE_DEP,search) $(SPEC_SEARCH)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH) $(TIMEOUT_SEARCH)

# Search_N
search_n: $(call GENERATE_DEP,search_n) $(SPEC_SEARCH_N)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH_N) $(NON_MUTATING_DEFAULT_TIMEOUT)

# Find_End
find_end: $(call GENERATE_DEP,find_end) $(SPEC_FIND_END)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_FIND_END) $(NON_MUTATING_DEFAULT_TIMEOUT)

# Count
count: $(call GENERATE_DEP,count) $(SPEC_COUNT)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_COUNT) $(NON_MUTATING_DEFAULT_TIMEOUT)

# All proofs
all: $(ALL_PROOF_TARGETS)
