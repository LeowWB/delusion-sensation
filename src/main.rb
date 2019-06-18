# frozen_string_literal: true

require 'byebug'
require './processor.rb'
require './iohandler.rb'
include Processor
include IOHandler

def main
  raw_file_name, filter_file_name, out_file_name = get_file_names

  raw_text_list = read_by_split_regex raw_file_name, /[^\w$&-]+/
  raw_text_list.each do |w|
    w.downcase!
  end

  filter_list = read_by_line filter_file_name
  filter_list.sort!

  raw_text_list = process_list raw_text_list, filter_list
  raw_text = raw_text_list.join " "

  write out_file_name, raw_text
end

def get_file_names
  puts "Raw file: "
  raw_file_name = gets.chomp

  puts "Filter file: "
  filter_file_name = gets.chomp
  
  puts "Output file: "
  out_file_name = gets.chomp
  
  return [raw_file_name, filter_file_name, out_file_name]
end

main