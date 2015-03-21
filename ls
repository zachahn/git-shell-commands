#!/usr/bin/env ruby

require_relative "lib/colors"

Dir[File.join(ENV["HOME"], "*.git")].each do |file|
  puts C(File.basename(file), :blue, :bold)
end

