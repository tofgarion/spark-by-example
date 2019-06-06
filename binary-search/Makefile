PROJECT      = binary_search_algorithms.gpr
CHAPTER_NAME = binary-search

# timeout for chapter
BINARY_SEARCH_DEFAULT_TIMEOUT = "TIMEOUT=5"

# specification dependencies for each function
SPEC_TYPES		= ../spec/types.ads
SPEC_BOUNDS		= ../spec/sorted_p.ads ../spec/upper_bound_p.ads ../spec/lower_bound_p.ads
SPEC_SEARCH_BOUND	= $(SPEC_BOUNDS) $(SPEC_TYPES)
SPEC_SEARCH_EQUAL_RANGE	= search_upper_bound_p.ads search_lower_bound_p.ads ../spec/constant_range_p.ads $(SPEC_BOUNDS) $(SPEC_TYPES) $(call GENERATE_DEP, search_upper_bound) $(call GENERATE_DEP, search_lower_bound)
SPEC_BINARY_SEARCH	= search_lower_bound_p.ads ../spec/has_value_p.ads $(SPEC_BOUNDS) $(SPEC_TYPES) $(call GENERATE_DEP, search_lower_bound)

# level for each function
LEVEL_SEARCH_BOUND	= 0
LEVEL_EQUAL_RANGE 	= 1
LEVEL_BINARY_SEARCH     = 1

# all proof targets
ALL_PROOF_TARGETS = search_upper_bound search_lower_bound search_equal_range search_equal_range2 binary_search

include ../Makefile-common

.PHONY: $(ALL_PROOF_TARGETS)

# Search_Upper_Bound
search_upper_bound: $(call GENERATE_DEP, search_upper_bound) $(SPEC_SEARCH_BOUND)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH_BOUND) $(BINARY_SEARCH_DEFAULT_TIMEOUT)

# Search_Lower_Bound
search_lower_bound: $(call GENERATE_DEP, search_lower_bound) $(SPEC_SEARCH_BOUND)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SEARCH_BOUND) $(BINARY_SEARCH_DEFAULT_TIMEOUT)

# Search_Equal_Range
search_equal_range: $(call GENERATE_DEP, search_equal_range) $(SPEC_EQUAL_RANGE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_EQUAL_RANGE) $(BINARY_SEARCH_DEFAULT_TIMEOUT)

search_equal_range_opt: $(call GENERATE_DEP, search_equal_range_opt) $(SPEC_EQUAL_RANGE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_EQUAL_RANGE) $(BINARY_SEARCH_DEFAULT_TIMEOUT)

# Binary_Search
binary_search: $(call GENERATE_DEP, binary_search) $(SPEC_BINARY_SEARCH)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_BINARY_SEARCH) $(BINARY_SEARCH_DEFAULT_TIMEOUT)

# All proofs
all: $(ALL_PROOF_TARGETS)
	$(_STATS_CHAPTER)
