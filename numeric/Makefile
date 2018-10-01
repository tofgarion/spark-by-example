PROJECT=numeric_algorithms.gpr

# timeout for chapter
NUMERIC_DEFAULT_TIMEOUT = "TIMEOUT=5"
NUMERIC_INV_TIMEOUT = "TIMEOUT=10"

# specification dependencies for each function
SPEC_TYPES		 = ../spec/types.ads
SPEC_OVERFLOW		 = ../spec/overflow.ads ../spec/overflow.adb $(SPEC_TYPES)
SPEC_IOTA		 = ../spec/is_iota_p.ads $(SPEC_TYPES)
SPEC_ACCUMULATE_NAIVE	 = ../spec/acc_def_naive_p.ads $(SPEC_TYPES)
SPEC_ACCUMULATE		 = ../spec/acc_def_p.ads $(SPEC_OVERFLOW) $(SPEC_TYPES)
SPEC_INNER_PRODUCT	 =../spec/inner_prod_def_p.ads $(SPEC_OVERFLOW) $(SPEC_TYPES)
SPEC_PARTIAL_SUM	 = ../spec/acc_def_p.ads $(SPEC_OVERFLOW) $(SPEC_TYPES)
SPEC_ADJACENT_DIFFERENCE = $(SPEC_OVERFLOW) $(SPEC_TYPES)
SPEC_NUMERIC_INV	 = ../spec/acc_def_p.ads $(SPEC_OVERFLOW) $(SPEC_TYPES) $(call GENERATE_DEP, adjacent_difference) $(call GENERATE_DEP, partial_sum)

# level for each function
LEVEL_IOTA 			= 0
LEVEL_ACCUMULATE_NAIVE 		= 0
LEVEL_ACCUMULATE 		= 1
LEVEL_INNER_PRODUCT 		= 1
LEVEL_PARTIAL_SUM 		= 1
LEVEL_ADJACENT_DIFFERENCE 	= 1
LEVEL_NUMERIC_INV 		= 1

# all proof targets
ALL_PROOF_TARGETS = iota accumulate inner_product partial_sum adjacent_difference numeric_inv

include ../Makefile-common

.PHONY:

# Iota
iota: $(call GENERATE_DEP, iota) $(SPEC_IOTA)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_IOTA) $(NUMERIC_DEFAULT_TIMEOUT)

# Accumulate
accumulate_naive: accumulate_naive_p.ads $(SPEC_ACCUMULATE_NAIVE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ACCUMULATE_NAIVE) $(NUMERIC_DEFAULT_TIMEOUT)

accumulate: $(call GENERATE_DEP, accumulate) $(SPEC_ACCUMULATE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ACCUMULATE) $(NUMERIC_DEFAULT_TIMEOUT)

# Inner_Product
inner_product: $(call GENERATE_DEP, inner_product) $(SPEC_INNER_PRODUCT)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_INNER_PRODUCT) $(NUMERIC_DEFAULT_TIMEOUT)

# Partial_Sum
partial_sum: $(call GENERATE_DEP, partial_sum) $(SPEC_PARTIAL_SUM)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_PARTIAL_SUM) $(NUMERIC_DEFAULT_TIMEOUT)

# Adjacent_Difference
adjacent_difference: $(call GENERATE_DEP, adjacent_difference) $(SPEC_ADJACENT_DIFFERENCE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ADJACENT_DIFFERENCE) $(NUMERIC_DEFAULT_TIMEOUT)

# Numeric_Inv
numeric_inv: numeric_inv.adb numeric_inv.ads $(SPEC_NUMERIC_INV)
	make prove FILE=$@.adb LEVEL=$(LEVEL_NUMERIC_INV) $(NUMERIC_INV_TIMEOUT)

# All proods
all: $(ALL_PROOF_TARGETS)
	$(if $(STATS), python ../stats/generate_csv_chapter.py numeric; python ../stats/generate_csv_chapter_stdout.py numeric,)
