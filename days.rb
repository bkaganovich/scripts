#!/usr/bin/env ruby

# File: days.rb
# Counts number of days between target date and today.
# If no target date is specified as argument vector, 
# then last day of year is used.

# Example:
# ./days.rb 2022-06-30
# 9 days until 2022-06-30

require 'date'

today = Date.today()
end_of_year = "31/12/#{Date.today.year}"
target = ARGV.empty? ? end_of_year : ARGV[0]
target = Date.parse(target)
days = (target - today).to_i

puts "#{days} days until #{target}"
