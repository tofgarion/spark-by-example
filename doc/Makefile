_NON_MUTATING_ORG_FILES = Adjacent_Find.org Count.org Equal_Mismatch.org \
	Find_End.org Find_First_Of.org Find.org README.org Search_N.org Search.org

NON_MUTATING_ORG_FILES = $(patsubst %, ../non-mutating/%, $(_NON_MUTATING_ORG_FILES))

../non-mutating/%.org: org_templates/non-mutating/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(NON_MUTATING_ORG_FILES)

_MAXMIN_ORG_FILES = Max_Element.org Min_Element.org Max_Seq.org

MAXMIN_ORG_FILES = $(patsubst %, ../maxmin/%, $(_MAXMIN_ORG_FILES))

../maxmin/%.org: org_templates/maxmin/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(MAXMIN_ORG_FILES)

_MUTATING_ORG_FILES = Copy.org Fill.org Random_Shuffle.org Remove_Copy.org \
	Replace_Copy.org Replace.org Reverse_Copy.org Reverse_In_Place.org \
	Rotate_Copy.org Rotate.org Swap.org Swap_Ranges.org

MUTATING_ORG_FILES = $(patsubst %, ../mutating/%, $(_MUTATING_ORG_FILES))

../mutating/%.org: org_templates/maxmin/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(MUTATING_ORG_FILES)
