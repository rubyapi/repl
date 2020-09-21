require 'json'
require 'test/unit'

require_relative '../app/run'

class ReplTest < Test::Unit::TestCase
  def test_normal_execution
    event = {
      body: <<~BODY,
        puts "Hello World!"
      BODY
    }

    assert_equal(lambda_handler(event: event, context: ''), {
      statusCode: 200,
      body: {
        output: "Hello World!\nnil\n",
        error: "",
        status: 0
      }.to_json
    })
  end

  def test_error
    event = {
      body: <<~BODY,
        raise 'test'
      BODY
    }

    assert_equal(lambda_handler(event: event, context: ''), {
      statusCode: 200,
      body: {
        output: "",
        error: "-:17:in `<main>': test (RuntimeError)\n",
        status: 1
      }.to_json
    })
  end
end
