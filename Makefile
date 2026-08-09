ci: clean stage deps test-oag-file-spec test-oag-file-spec-partials test-oag-url-spec test-oag-url-spec-partials
ci-local: clean stage deps test-oag-file-spec-local test-oag-url-spec-local

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# oag-file-spec targets
########################################

clean-oag-file-spec:
	rm -rf stage/oag-file-spec/

generate-oag-file-spec: clean-oag-file-spec
	node_modules/.bin/plop oag-file-spec

test-oag-file-spec:
	node_modules/.bin/plop oag-file-spec -- \
	  --project_id "oagfilespec" \
		--project_name "OAGFileSpec" \
		--project_desc "A sample OpenAPI from file spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-file-spec" \
		--github_token_prefix "STUDIO"
	cd stage/oag-file-spec/ && CUSTOM=true make init-generators-config ci

test-oag-file-spec-local:
	node_modules/.bin/plop oag-file-spec -- \
	  --project_id "oagfilespec" \
		--project_name "OAGFileSpec" \
		--project_desc "A sample OpenAPI from file spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-file-spec" \
		--github_token_prefix "STUDIO"
	cd stage/oag-file-spec/ && LOCAL=true make init-generators-config ci

########################################
# oag-file-spec-partials targets
########################################

clean-oag-file-spec-partials:
	rm -rf stage/oag-file-spec-partials/

generate-oag-file-spec-partials: clean-oag-file-spec-partials
	node_modules/.bin/plop oag-file-spec-partials

test-oag-file-spec-partials:
	node_modules/.bin/plop oag-file-spec-partials -- \
	  --project_id "oagfilespec" \
		--project_name "OAGFileSpec" \
		--project_desc "A sample OpenAPI from file spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-file-spec" \
		--github_token_prefix "STUDIO"

########################################
# oag-url-spec targets
########################################

clean-oag-url-spec:
	rm -rf stage/oag-url-spec/

generate-oag-url-spec: clean-oag-url-spec
	node_modules/.bin/plop oag-url-spec

test-oag-url-spec:
	node_modules/.bin/plop oag-url-spec -- \
	  --project_id "oagurlspec" \
		--project_name "OAGURLSpec" \
		--project_desc "A sample OpenAPI from URL spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-url-spec" \
		--github_token_prefix "STUDIO"
	cd stage/oag-url-spec/ && CUSTOM=true make init-generators-config ci

test-oag-url-spec-local:
	node_modules/.bin/plop oag-url-spec -- \
	  --project_id "oagurlspec" \
		--project_name "OAGURLSpec" \
		--project_desc "A sample OpenAPI from URL spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-url-spec" \
		--github_token_prefix "STUDIO"
	cd stage/oag-url-spec/ && LOCAL=true make init-generators-config ci

########################################
# oag-url-spec-partials targets
########################################

clean-oag-url-spec-partials:
	rm -rf stage/oag-url-spec-partials/

generate-oag-url-spec-partials: clean-oag-url-spec-partials
	node_modules/.bin/plop oag-url-spec-partials

test-oag-url-spec-partials:
	node_modules/.bin/plop oag-url-spec-partials -- \
	  --project_id "oagurlspec" \
		--project_name "OAGURLSpec" \
		--project_desc "A sample OpenAPI from URL spec" \
		--author_name "Pakkun" \
		--author_email "pakkunbot@users.noreply.github.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot" \
		--github_repo "oag-url-spec" \
		--github_token_prefix "STUDIO"

update-swaggy-c-to-latest:
	cd templates/oag-file-spec && make update-to-latest
	cd templates/oag-url-spec && make update-to-latest

.PHONY: ci clean clean-oag-file-spec clean-oag-file-spec-partials clean-oag-url-spec clean-oag-url-spec-partials stage deps generate-oag-file-spec test-oag-file-spec generate-oag-file-spec-partials test-oag-file-spec-partials generate-oag-url-spec test-oag-url-spec generate-oag-url-spec-partials test-oag-url-spec-partials update-swaggy-c-to-latest
