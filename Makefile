ci: clean stage deps test-oag-file-spec test-oag-file-spec-partials test-oag-url-spec test-oag-url-spec-partials
ci-local: clean stage deps test-oag-file-spec-local test-oag-url-spec-local

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= swaggy-c.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

########################################
# oag-file-spec targets
########################################

clean-oag-file-spec:
	rm -rf stage/oag-file-spec/

generate-oag-file-spec: clean-oag-file-spec
	node_modules/.bin/plop oag-file-spec

$(eval $(call set_generator_vars,generate-oag-file-spec-with-config,$(GENERATOR_CONFIG)))
generate-oag-file-spec-with-config: clean-oag-file-spec
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-oag-file-spec:
	make generate-oag-file-spec-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-file-spec.yml
	cd stage/oag-file-spec/ && CUSTOM=true make init-generators-config ci

test-oag-file-spec-local:
	make generate-oag-file-spec-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-file-spec.yml
	cd stage/oag-file-spec/ && LOCAL=true make init-generators-config ci

########################################
# oag-file-spec-partials targets
########################################

clean-oag-file-spec-partials:
	rm -rf stage/oag-file-spec-partials/

generate-oag-file-spec-partials: clean-oag-file-spec-partials
	node_modules/.bin/plop oag-file-spec-partials

$(eval $(call set_generator_vars,generate-oag-file-spec-partials-with-config,$(GENERATOR_CONFIG)))
generate-oag-file-spec-partials-with-config: clean-oag-file-spec-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-oag-file-spec-partials:
	make generate-oag-file-spec-partials-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-file-spec-partials.yml

########################################
# oag-url-spec targets
########################################

clean-oag-url-spec:
	rm -rf stage/oag-url-spec/

generate-oag-url-spec: clean-oag-url-spec
	node_modules/.bin/plop oag-url-spec

$(eval $(call set_generator_vars,generate-oag-url-spec-with-config,$(GENERATOR_CONFIG)))
generate-oag-url-spec-with-config: clean-oag-url-spec
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-oag-url-spec:
	make generate-oag-url-spec-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-url-spec.yml
	cd stage/oag-url-spec/ && CUSTOM=true make init-generators-config ci

test-oag-url-spec-local:
	make generate-oag-url-spec-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-url-spec.yml
	cd stage/oag-url-spec/ && LOCAL=true make init-generators-config ci

########################################
# oag-url-spec-partials targets
########################################

clean-oag-url-spec-partials:
	rm -rf stage/oag-url-spec-partials/

generate-oag-url-spec-partials: clean-oag-url-spec-partials
	node_modules/.bin/plop oag-url-spec-partials

$(eval $(call set_generator_vars,generate-oag-url-spec-partials-with-config,$(GENERATOR_CONFIG)))
generate-oag-url-spec-partials-with-config: clean-oag-url-spec-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-oag-url-spec-partials:
	make generate-oag-url-spec-partials-with-config GENERATOR_CONFIG=examples/swaggy-c-oag-url-spec-partials.yml

update-swaggy-c-to-latest:
	cd templates/oag-file-spec && make update-to-latest
	cd templates/oag-url-spec && make update-to-latest

.PHONY: ci ci-local clean clean-oag-file-spec clean-oag-file-spec-partials clean-oag-url-spec clean-oag-url-spec-partials stage deps generate-oag-file-spec generate-oag-file-spec-with-config test-oag-file-spec test-oag-file-spec-local generate-oag-file-spec-partials generate-oag-file-spec-partials-with-config test-oag-file-spec-partials generate-oag-url-spec generate-oag-url-spec-with-config test-oag-url-spec test-oag-url-spec-local generate-oag-url-spec-partials generate-oag-url-spec-partials-with-config test-oag-url-spec-partials update-swaggy-c-to-latest
