#!/bin/bash

set -euox pipefail

export TMPDIR=/build
export RUBY_BUILD_CACHE_PATH=/build/cache
export RUBY_CFLAGS="-Os"
export KEEP_BUILD_PATH="yes"
export RUBY_CONFIGURE_OPTS="--disable-install-doc"

git clone https://github.com/rbenv/ruby-build /opt/ruby-build --depth 1

if [[ $1 =~ "mruby" ]] || [[ $1 == "3.0.0-dev" ]]; then
  yum install -y ruby24 rubygem24-rake
fi

/opt/ruby-build/bin/ruby-build $1 /build/ruby-tmp

if [[ $1 =~ "mruby" ]]; then
  cp /lib64/libncurses.so.5 /lib64/libtinfo.so.5 /build/ruby-tmp/lib/
fi

chown -R $UID /build/ruby-tmp

cp -af /build/ruby-tmp/. /build/ruby/