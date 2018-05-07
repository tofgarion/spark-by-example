_ORG_FILES = Find.org Bla.org
ORG_FILES = $(patsubst %, org/%, $(_ORG_FILES))

org/%.org: org_templates/%.org
	echo "$^" | emacs --batch -l ./generate-org.el -f generate-org-from-org

generate-org-files: $(ORG_FILES)
