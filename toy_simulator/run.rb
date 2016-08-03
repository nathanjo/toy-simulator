#!/usr/bin/env ruby

require_relative 'simulator'

simulator = Simulator.new

while a = gets
  puts "Reading: #{a}"
  err, msg = simulator.execute(a)
  if err == true
    puts msg
    exit
  end
end