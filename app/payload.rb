require_relative './helper'

require 'erb'

class Payload
  include Helper

  CODE_TEMPLATE = <<~TEMPLATE
    <% unless minimal_execution? %>
    %w(abbrev base64 benchmark bigdecimal cgi cmath coverage csv date dbm delegate digest drb English
      erb etc expect fcntl fiddle fileutils find forwardable gdbm getoptlong io/console io/nonblock
      io/wait ipaddr irb json logger matrix mkmf monitor mutex_m net/ftp net/http net/imap net/smtp net/pop
      net/telnet nkf objspace observer open-uri open3 openssl optparse ostruct pathname pp
      prettyprint prime pstore psych pty racc/parser rake rdoc readline resolv ripper rss scanf
      sdbm securerandom set shell shellwords singleton socket stringio strscan sync syslog tempfile thwait time
      timeout tmpdir tracer tsort un uri weakref webrick yaml zlib).each do |l|
      begin
        require l
      rescue LoadError
      end
    end
    <% end %>

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