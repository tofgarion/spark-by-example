PROJECT      = classic_sorting_algorithms.gpr
CHAPTER_NAME = classic-sorting

# timeout for chapter
CLASSIC_SORTING_DEFAULT_TIMEOUT = "TIMEOUT=10"

# specification dependencies for each function
SPEC_TYPES_MULTISET_SORTED = ../spec/types.ads ../spec/sorted_p.ads ../spec/multiset_predicates.ads
SPEC_SELECTION_SORT 	   = $(call GENERATE_DEP, ../mutating/swap_array) $(call GENERATE_DEP, ../maxmin/min_element) ../spec/lower_bound_p.ads $(SPEC_TYPES_MULTISET_SORTED)
SPEC_INSERTION_SORT 	   = $(call GENERATE_DEP, ../binary-search/search_upper_bound) $(call GENERATE_DEP, ../mutating/swap_array) ../spec/lower_bound_p.ads ../spec/upper_bound_p.ads $(SPEC_TYPES_MULTISET_SORTED)
SPEC_HEAP_SORT 		   = $(call GENERATE_DEP, ../heap/make_heap) $(call GENERATE_DEP, ../heap/sort_heap) $(SPEC_TYPES_MULTISET_SORTED)

# level for each function
LEVEL_SELECTION_SORT = 1
LEVEL_INSERTION_SORT = 1
LEVEL_HEAP_SORT = 1

# all proof targets
ALL_PROOF_TARGETS = selection_sort insertion_sort heap_sort

include ../Makefile-common

.PHONY:

# Selection_Sort
selection_sort: $(call GENERATE_DEP, selection_sort)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SELECTION_SORT) $(CLASSIC_SORTING_DEFAULT_TIMEOUT)

# Insertion_Sort
insertion_sort: $(call GENERATE_DEP, insertion_sort)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_INSERTION_SORT) $(CLASSIC_SORTING_DEFAULT_TIMEOUT)

# Heap_Sort
heap_sort: $(call GENERATE_DEP, heap_sort)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_HEAP_SORT) $(CLASSIC_SORTING_DEFAULT_TIMEOUT)

# all proofs
all: $(ALL_PROOF_TARGETS)
	$(_STATS_CHAPTER)
