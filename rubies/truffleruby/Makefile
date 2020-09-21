
build-TruffleRuby:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh truffleruby-20.2.0