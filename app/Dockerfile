# syntax=docker/dockerfile:1
FROM public.ecr.aws/lambda/ruby:2.7 as builder

WORKDIR /opt

ARG RUBY_VERSION=3.0.3
ENV RUBY_CFLAGS="-Os"
ENV RUBY_CONFIGURE_OPTS="--disable-install-doc"

RUN yum groupinstall -y 'Development Tools' && \
  yum install -y openssl-devel java-1.8.0-openjdk

RUN git clone https://github.com/rbenv/ruby-build /opt/ruby-build --depth 1 && \
  /opt/ruby-build/bin/ruby-build ${RUBY_VERSION} /opt/ruby



FROM public.ecr.aws/lambda/ruby:2.7 as app

ENV GEM_HOME=${LAMBDA_TASK_ROOT}

RUN yum install -y java-1.8.0-openjdk

COPY --from=builder /opt/ruby/ /opt/ruby/
COPY . ./

RUN bundle install

# Command can be overwritten by providing a different command in the template directly.
CMD ["app.lambda_handler"]