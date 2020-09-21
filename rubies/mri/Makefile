build-MRIRuby27:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 2.7.1

build-MRIRuby26:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 2.6.6

build-MRIRuby25:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 2.5.8

build-MRIRuby24:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 2.4.9

build-MRIRuby23:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 2.3.8

build-MRIRuby30:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh 3.0.0-dev