_NON_MUTATING_ORG_FILES = Find.org
NON_MUTATING_ORG_FILES = $(patsubst %, ../non-mutating/%, $(_NON_MUTATING_ORG_FILES))

../non-mutating/%.org: org_templates/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(NON_MUTATING_ORG_FILES)
