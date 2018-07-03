PROJECT=sorting_algorithms.gpr

#timeout for chapter
SORTING_DEFAULT_TIMEOUT = "TIMEOUT=20"

#All proof target
ALL_PROOF_TARGET = is_sorted partial_sort

#specification dependencies for each function
SPEC_TYPES       		= ../spec/types.ads
SPEC_HEAP 			= $(call GENERAT_DEP, ../heap/push_heap) $(call GENERAT_DEP, ../heap/pop_heap) $(call GENERAT_DEP, ../heap/make_heap) $(call GENERAT_DEP, ../heap/sort_heap)
SPEC_PREDICATES			= ../spec/multiset_predicates.ads ../spec/heap_predicates.ads ../spec/occ_def_p.ads ../spec/sorted_p.ads ../spec/partition_p.ads ../spec/lower_bound_p.ads ../spec/upper_bound_p.ads 
SPEC_LEMMAS 			=  ../lemmas/classic_lemmas.ads ../lemmas/classic_lemmas.adb ../lemmas/partial_sort_lemmas.ads ../lemmas/partial_sort_lemmas.adb
SPEC_IS_SORTED 			= $(SPEC_TYPES) ../spec/sorted_p.ads
SPEC_PARTIAL_SORT 		= $(SPEC_TYPES) $(SPEC_HEAP) $(SPEC_PREDICATES) $(SPEC_LEMMAS) $(call GENERATE_DEP, ../mutating/swap_array)

#proof level for each function
LEVEL_IS_SORTED    = 1
LEVEL_PARTIAL_SORT = 1

include ../Makefile-common

is_sorted: $(call GENERATE_DEP, is_sorted) $(SPEC_IS_SORTED)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_IS_SORTED) $(SORTING_DEFAULT_TIMEOUT)

partial_sort: $(call GENERATE_DEP, partial_sort) $(SPEC_PARTIAL_SORT)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_PARTIAL_SORT) $(SORTING_DEFAULT_TIMEOUT)


all: $(ALL_PROOF_TARGET)
	$(if $(STATS), python ../stats/generate_csv_chapter.py sorting; python ../stats/generate_csv_chapter_stdout.py sorting,)
