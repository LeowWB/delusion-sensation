# frozen_string_literal: true

require 'byebug'
require './processor.rb'
include Processor

def main
  raw_file_name, filter_file_name, out_file_name = get_file_names

  raw_text_list = []
  raw_file = File.open raw_file_name, "r"
  
  raw_file.each do |l|
    raw_text_list.append l.downcase.split(/[^\w$&-]+/)
  end

  raw_file.close
  raw_text_list.flatten!


  filter_list = []  
  filter_file = File.open filter_file_name, "r"

  filter_file.each do |l|
    filter_list << l.chomp
  end

  filter_file.close
  filter_list.sort!

  raw_text_list = process_list raw_text_list, filter_list
  raw_text = raw_text_list.join " "

  output = ""
  out_file = File.open out_file_name, "w"
  out_file.write raw_text
  out_file.close
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