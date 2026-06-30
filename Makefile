
ALL_TESTS = $(shell find test/ -name '*.test.js')

run-tests:
	@./node_modules/.bin/expresso \
		-I lib \
		-I support \
		--serial \
		$(TESTS)

test:
	@$(MAKE) TESTS="$(ALL_TESTS)" run-tests

test-acceptance:
	@node support/test-runner/app $(TRANSPORT)

build:
	@node ./bin/builder.js

setup:
	npm ci --ignore-scripts  # expresso tries to install broken packages via scripts

.PHONY: test
