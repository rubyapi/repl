build-ArtichokeRuby:
	mkdir -p "$(ARTIFACTS_DIR)/ruby"
	docker run --rm --user "$(id -u):$(id -g)" --mount type=bind,source="$(PWD)"/scripts,target=/scripts --mount type=bind,source="$(ARTIFACTS_DIR)/ruby",target=/build/ruby lambci/lambda:build-provided /scripts/build-ruby.sh artichoke-dev