require_relative './payload'

require 'open3'

Response = Struct.new(:output, :errors, :status, keyword_init: true) do
  def status
    self[:status] || 0
  end
end

class CodeExecutor
  attr_accessor :payload

  def self.run(body)
    new(body).run
  end

  def initialize(body)
    @payload = Payload.generate_from_body(body)
  end

  def run
    execute_payload
  end

  private

  def execute_payload
    stdout, stderr, status = Open3.capture3(ruby_cmd, stdin_data: payload)
    Response.new(output: stdout, errors: stderr, status: status&.exitstatus)
  end

  def ruby_cmd
    [ruby_bin_path, ruby_args].join(" ")
  end

  def ruby_bin_path
    if ENV["RUBY_BIN_PATH"] && !ENV["RUBY_BIN_PATH"].empty?
      ENV["RUBY_BIN_PATH"]
    else
      "/opt/ruby/bin/ruby"
    end
  end

  def ruby_args
    ENV["ENGINE_ARGS"]
  end
end