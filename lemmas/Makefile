PROJECT=lemmas.gpr

# timeout for lemmas
LEMMAS_DEFAULT_TIMEOUT = "TIMEOUT=5"

# specification dependencies
SPEC_TYPES    = ../spec/types.ads
SPEC_MULTISET = ../spec/multiset_predicates.ads
SPEC_OCC      = ../spec/occ_def_p.ads ../spec/occ_p.ads
SPEC_VALUE    = ../spec/has_value_p.ads
SPEC_CLASSIC  = $(SPEC_TYPES) $(SPEC_MULTISET) $(SPEC_OCC) $(SPEC_VALUE)

# proof level for lemmas
LEVEL_CLASSIC = 4

include ../Makefile-common

# classic lemmas
classic: classic_lemmas.ads classic_lemmas.adb $(SPEC_CLASSIC)
	make prove FILE=classic_lemmas.adb LEVEL=$(LEVEL_CLASSIC) $(LEMMAS_DEFAULT_TIMEOUT)
