build-JRuby:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --user "$(id -u):$(id -g)" --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh jruby-9.2.9.0