# RubyAPI Repl Service

This project powers the REPL functionality for http://rubyapi.org. The application is based on the [AWS SAM](https://aws.amazon.com/serverless/sam/) framework where the app is made up of Lambda functions that are invoked via a HTTP endpoint.

The Lambda functions & HTTP API are all specified in the [template.yaml](https://github.com/rubyapi/repl/blob/master/template.yaml) file.

## Getting Started

Install the [AWS SAM CLI](https://github.com/aws/aws-sam-cli) tool via your relevant package manager.

Finally, install application dependencies via Bundler:

```
$ bundle install
```

### Start local server

The development server can be started via SAM:

```bash
$ sam local start-api
```

**Note** The local dev server does not automatically build the Ruby Engine layer that each function depends on. You will need to build the layer beforehand for the engine/version being invoked ie:

```
$ sam build MRIRuby
$ sam local start-api
$ curl http://localhost:3000/exec/mri
```

## Testing repl function

The test suit is located in `tests` and can be executed with:

```bash
$ ruby tests/unit/*
```

## Deploy to AWS

Deploying to AWS is done via the [SAM CLI tool](https://github.com/aws/aws-sam-cli), it will take care of packaging, pushing and deploying the lambda functions to AWS

```
$ sam build && sam deploy --guided
```

## Code of Conduct

Everyone interacting with the source code, issue trackers, chat rooms, and mailing lists is expected to follow the [Code Of Conduct](https://github.com/rubyapi/repl/blob/master/CODE_OF_CONDUCT.md)

## Resources

See the [AWS SAM developer guide](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html) for SAM usage & documentation