# frozen_string_literal: true

require './../src/processor.rb'
include Processor

describe Processor do
  context "With valid input" do
    it "should remove occurrence of filtered word" do
      raw = "a b c d e f g"
      filter = "a"
      expect(process_helper raw, filter).to eq "b c d e f g"
    end
    
    it "should remove all occurrences of filtered word" do
      raw = "a b c a d e f g a a"
      filter = "a"
      expect(process_helper raw, filter).to eq "b c d e f g"
    end

    it "should remove all occurrences of all filtered words" do
      raw = "a b c a d b e a f g b"
      filter = "a b"
      expect(process_helper raw, filter).to eq "c d e f g"
    end

    it "should not remove filtered words that occur as part of nonfiltered words" do
      raw = "ab a b c abc ac bc aa bb"
      filter = "a b"
      expect(process_helper raw, filter).to eq "ab c abc ac bc aa bb"
    end
  end
end

def process_helper raw, filter
  raw_list = raw.split " "
  filter_list = filter.split " "
  result = process_list raw_list, filter_list
  result.join " "
end