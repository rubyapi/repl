build-Java:
	mkdir -p "$(ARTIFACTS_DIR)/java"
	curl -L https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15%2B36/OpenJDK15U-jre_x64_linux_hotspot_15_36.tar.gz | \
		tar --strip-components=1 -C "$(ARTIFACTS_DIR)/java" -xzvf - jdk-15+36-jre
