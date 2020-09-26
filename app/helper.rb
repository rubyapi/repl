module Helper
  def ruby_bin_path
    ENV["RUBY_BIN"] || `which ruby`.strip
  end
  
  def engine_args?
    !engine_args.nil?
  end

  def engine_args
    ENV["ENGINE_ARGS"]
  end

  def minimal_execution?
    ENV["MINIMAL_EXECUTION"] && !ENV["MINIMAL_EXECUTION"].empty?
  end
end