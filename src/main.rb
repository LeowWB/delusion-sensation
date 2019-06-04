require 'byebug'

# frozen_string_literal: true

raw_text = []
filter_list = []
output = ""

puts "Raw file location: "
raw_file = File.open gets.chomp, "r"

raw_file.each do |l|
  raw_text.append l.downcase.split(/[^\w$&-]+/)
end

raw_file.close
raw_text.flatten!

puts "Filter file location: "
filter_file = File.open gets.chomp, "r"

filter_file.each do |l|
  filter_list << l.chomp
end

filter_file.close

filter_list.sort!

raw_text.select! do |w|
  not filter_list.include? w
end

puts "Output file location: "
out_file = File.open gets.chomp, "w"
out_file.write raw_text.join(" ")
out_file.close
