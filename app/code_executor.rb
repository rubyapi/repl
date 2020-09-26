require_relative './helper'
require_relative './response'
require_relative './payload'

require 'open3'

class CodeExecutor
  include Helper

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
    [ruby_env, ruby_bin_path, ruby_args].join(" ")
  end

  # Workaround for SAM overwriting the PATH env
  def ruby_env
    "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/opt/bin:/opt/java/bin\""
  end

  def ruby_bin_path
    ENV["RUBY_BIN"] || `which ruby`.strip
  end

  def ruby_args
    return engine_args if engine_args?

    "--disable-did_you_mean --disable-gems"
  end
end