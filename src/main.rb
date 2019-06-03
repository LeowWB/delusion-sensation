require 'byebug'

# frozen_string_literal: true

puts "Raw file location: "
raw_file = File.open gets.chomp, "r"

puts "Filter file location: "
filter_file = File.open gets.chomp, "r"

puts "Output file location: "
out_file = File.open gets.chomp, "w"

filter_list = []

filter_file.each do |l|
  filter_list << l
end

filter_list.sort!
