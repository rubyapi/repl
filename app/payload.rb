require 'erb'

class Payload
  CODE_TEMPLATE = <<~TEMPLATE
    _ = begin
      <%= payload %>
    end
    puts _.inspect
  TEMPLATE

  attr_reader :payload

  def self.generate_from_body(body)
    new(body).generate
  end

  def initialize(payload)
    @payload = payload
  end

  def generate
    b = binding
    template = ERB.new(CODE_TEMPLATE).result(b)
  end
end