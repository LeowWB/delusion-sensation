# frozen_string_literal: true

require 'byebug'
require './processor.rb'
include Processor

def main
  raw_text_list = []
  filter_list = []
  output = ""

  puts "Raw file location: "
  raw_file = File.open gets.chomp, "r"

  raw_file.each do |l|
    raw_text_list.append l.downcase.split(/[^\w$&-]+/)
  end

  raw_file.close
  raw_text_list.flatten!

  puts "Filter file location: "
  filter_file = File.open gets.chomp, "r"

  filter_file.each do |l|
    filter_list << l.chomp
  end

  filter_file.close

  filter_list.sort!

  raw_text_list = process_list raw_text_list, filter_list

  puts "Output file location: "
  out_file = File.open gets.chomp, "w"
  out_file.write raw_text_list.join(" ")
  out_file.close
end

main