module Processor
  def process_list raw_text_list, filter_list
    raw_text_list.select do |w|
      not filter_list.include? w
    end
  end
end