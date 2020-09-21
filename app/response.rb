# frozen_string_literal: true

Response = Struct.new(:output, :errors, :status, keyword_init: true) do
  def status
    self[:status] || 0
  end
end