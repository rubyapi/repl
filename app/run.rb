# frozen_string_literal: true

require 'json'
require 'open3'

require_relative './helper'
require_relative './code_executor'

def lambda_handler(event:, context:)
  event.transform_keys!(&:to_sym)

  body = event.fetch(:body)

  return { statusCode: 400, body: {}.to_json } if body.empty?

  response = CodeExecutor.run(body)

  {
    statusCode: 200,
    body: { output: response.output, error: response.errors, status: response.status }.to_json
  }
end

