_NON_MUTATING_ORG_FILES = Adjacent_Find.org Count.org Equal_Mismatch.org \
	Find_End.org Find_First_Of.org Find.org README.org Search_N.org Search.org

_MAXMIN_ORG_FILES = Max_Element.org Min_Element.org Max_Seq.org

_BINARY_SEARCH_ORG_FILES = Search_Lower_Bound.org Search_Upper_Bound.org Search_Equal_Ranges.org Binary_Search.org

_MUTATING_ORG_FILES = Copy.org Fill.org Random_Shuffle.org Remove_Copy.org \
	Replace_Copy.org Replace.org Reverse_Copy.org Reverse_In_Place.org \
	Rotate_Copy.org Rotate.org Swap.org Swap_Ranges.org

_NUMERIC_ORG_FILES = Iota.org Inner_Product.org Adjacent_Difference.org Accumulate.org Partial_Sum.org Numeric_Inv.org

_SORTING_ORG_FILES = Is_Sorted.org Partial_Sort.org

NON_MUTATING_ORG_FILES = $(patsubst %, ../non-mutating/%, $(_NON_MUTATING_ORG_FILES))

MAXMIN_ORG_FILES = $(patsubst %, ../maxmin/%, $(_MAXMIN_ORG_FILES))

BINARY_SEARCH_ORG_FILES = $(patsubst %, ../binary-search/%, $(_BINARY_SEARCH_ORG_FILES))

MUTATING_ORG_FILES = $(patsubst %, ../mutating/%, $(_MUTATING_ORG_FILES))

NUMERIC_ORG_FILES = $(patsubst %, ../numeric/%, $(_NUMERIC_ORG_FILES))

SORTING_ORG_FILES = $(patsubst %, ../sorting/%, $(_SORTING_ORG_FILES))

../non-mutating/%.org: org_templates/non-mutating/%.org

	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

../maxmin/%.org: org_templates/maxmin/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

../binary-search/%.org: org_templates/binary-search/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

../mutating/%.org: org_templates/mutating/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

../numeric/%.org: org_templates/numeric/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

../sorting/%.org: org_templates/sorting/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(NON_MUTATING_ORG_FILES) $(MAXMIN_ORG_FILES) $(MUTATING_ORG_FILES) $(NUMERIC_ORG_FILES) $(SORTING_ORG_FILES)

