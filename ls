#!/usr/bin/env ruby

require_relative "lib/pig"

Dir[File.join(ENV["HOME"], "*.git")].each do |file|
  puts Pig.new(File.basename(file)).blue.bold
end
