# _NON_MUTATING_ORG_FILES = Adjacent_Find.org Count.org Equal_Mismatch.org \
# 	Find_End.org Find_First_Of.org Find.org README.org Search_N.org Search.org
_NON_MUTATING_ORG_FILES = Find.org README.org

NON_MUTATING_ORG_FILES = $(patsubst %, ../non-mutating/%, $(_NON_MUTATING_ORG_FILES))

../non-mutating/%.org: org_templates/non-mutating/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(NON_MUTATING_ORG_FILES)
