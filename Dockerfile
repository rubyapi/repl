# syntax=docker/dockerfile:1
FROM public.ecr.aws/lambda/ruby:2.7 as builder

ARG RUBY_VERSION=3.1.2
ARG RUBY_INSTALL_PATH=/opt/ruby/
ARG JAVA_REQUIRED

ENV RUBY_CFLAGS="-Os"
ENV RUBY_CONFIGURE_OPTS="--disable-install-doc"

RUN yum groupinstall -y 'Development Tools' && \
  yum install -y openssl-devel

RUN if [[ "$JAVA_REQUIRED" == "true" ]]; then yum install -y java-1.8.0-openjdk; fi

RUN git clone https://github.com/rbenv/ruby-build /opt/ruby-build --depth 1 && \
  /opt/ruby-build/bin/ruby-build ${RUBY_VERSION} ${RUBY_INSTALL_PATH}


FROM public.ecr.aws/lambda/ruby:2.7 as app

ARG RUBY_INSTALL_PATH=/opt/ruby/
ARG JAVA_REQUIRED

# ENV GEM_HOME=${LAMBDA_TASK_ROOT}
ENV LD_LIBRARY_PATH=${RUBY_INSTALL_PATH}/lib

RUN if [[ "$JAVA_REQUIRED" == "true" ]]; then yum install -y java-1.8.0-openjdk; fi

COPY --from=builder ${RUBY_INSTALL_PATH} ${RUBY_INSTALL_PATH}
COPY app ${LAMBDA_TASK_ROOT}/

RUN bundle install

# Command can be overwritten by providing a different command in the template directly.
CMD ["app.lambda_handler"]