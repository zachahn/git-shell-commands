#!/usr/bin/env ruby

Dir[File.join(ENV["HOME"], "*.git")].each do |file|
  puts File.basename(file)
end

