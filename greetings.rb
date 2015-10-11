#!/usr/bin/ruby

A = Array.new

if ARGV.empty?
  raise "At least a name must be given."
end

ARGV.each do|a|
  A << a
end


puts "#"*(16+A.join(" ").length.to_i)
puts "# Hello User: #{A.join(" ")} #"
puts "#"*(16+A.join(" ").length.to_i)
