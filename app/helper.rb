module Helper
  def ruby_bin_path
    ENV["RUBY_BIN"] || `which ruby`.strip
  end
  
  def rubygems_required?
    ENV["RUBYGEMS_REQUIRED"] && !ENV["RUBYGEMS_REQUIRED"].empty? 
  end
  
  def disable_args?
    ENV["DISBALE_RUBY_ARGS"] && !ENV["DISBALE_RUBY_ARGS"].empty?
  end

  def minimal_execution?
    ENV["MINIMAL_EXECUTION"] && !ENV["DISBALE_RUBY_ARGS"].empty?
  end
end