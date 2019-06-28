# frozen_string_literal: true

module Joiner
  def apply_join raw_text, join_list
    join_list.each do |j|
      joined = j.gsub " ", ""
      raw_text.gsub! j, joined
    end
    raw_text
  end
end