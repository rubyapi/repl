require 'json'
require 'open3'

require_relative './code_executor'

def lambda_handler(event:, context:)
  event.transform_keys!(&:to_sym)

  body = event.fetch(:body)

  return empty_response if body.empty?

  response = CodeExecutor.run(body)

  puts("Finished REPL request: length=#{response.output.length} " \
    "error-length=#{response.errors.length} status=#{response.status}")

  {
    statusCode: 200,
    body: { output: response.output, error: response.errors, status: response.status }.to_json
  }
end

def empty_response
  { statusCode: 200, body: {} }
end