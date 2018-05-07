PROJECT=Heap_Algorithms.gpr

#timeout for chapter
HEAP_DEFAULT_TIMEOUT = "TIMEOUT=5"

# specification dependencies for each function
SPEC_TYPES_AND_HEAP 	 = ../spec/types.ads ../spec/heap_predicates.ads
SPEC_MULTISET_PREDICATES = ../spec/multiset_predicates.ads
SPEC_IS_HEAP 		 = $(SPEC_TYPES_AND_HEAP)
SPEC_PUSH_HEAP 		 = $(call GENERATE_DEP, ../lemmas/push_heap_lemmas) $(call GENERATE_DEP, ../lemmas/classic_lemmas) $(SPEC_MULTISET_PREDICATES) $(SPEC_TYPES_AND_HEAP)
SPEC_POP_HEAP 		 = ../spec/occ_p.ads ../spec/upper_bound_p.ads $(call GENERATE_DEP, ../mutating/swap_array_p) $(call GENERATE_DEP, ../lemmas/pop_heap_lemmas) $(call GENERATE_DEP, ../lemmas/classic_lemmas) $(SPEC_MULTISET_PREDICATES) $(SPEC_TYPES_AND_HEAP)
SPEC_MAKE_HEAP 		 = ../spec/occ_p.ads $(call GENERATE_DEP, ../lemmas/push_heap_lemmas) $(call GENERATE_DEP, ../lemmas/classic_lemmas) $(SPEC_MULTISET_PREDICATES) $(SPEC_TYPES_AND_HEAP)
SPEC_SORT_HEAP 		 = ../spec/sorted_p.ads ../spec/upper_bound_p.ads ../spec/lower_bound_p.ads  $(call GENERATE_DEP, pop_heap)  $(SPEC_MULTISET_PREDICATES) $(SPEC_TYPES_AND_HEAP)

# level for each function
LEVEL_IS_HEAP 	= 0
LEVEL_PUSH_HEAP = 1
LEVEL_POP_HEAP 	= 1
LEVEL_MAKE_HEAP = 1
LEVEL_SORT_HEAP = 1

# all proof targets
ALL_PROOF_TARGETS = is_heap push_heap pop_heap make_heap sort_heap

include ../Makefile-common

.PHONY:

# Is_Heap
is_heap: $(call GENERATE_DEP, is_heap)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_IS_HEAP) $(HEAP_DEFAULT_TIMEOUT)

# Push_Heap
push_heap: $(call GENERATE_DEP, push_heap)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_PUSH_HEAP)  $(HEAP_DEFAULT_TIMEOUT)

# Pop_Heap
pop_heap: $(call GENERATE_DEP, pop_heap)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_POP_HEAP)  $(HEAP_DEFAULT_TIMEOUT)

# Make_Heap
make_heap: $(call GENERATE_DEP, make_heap)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_MAKE_HEAP)  $(HEAP_DEFAULT_TIMEOUT)

# Sort_Heap
sort_heap: $(call GENERATE_DEP, sort_heap)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SORT_HEAP)  $(HEAP_DEFAULT_TIMEOUT)

# All proofs
all: $(ALL_PROOF_TARGETS)
