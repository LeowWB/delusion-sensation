# frozen_string_literal: true

module IOHandler
  def read_by_split_regex file_name, regex
    file = File.open file_name, "r"
    rv = []

    file.each do |l|
      rv.append l.split(regex)
    end

    rv.flatten
  end
  
  def read_by_line file_name
    file = File.open file_name, "r"
    rv = []
    
    file.each do |l|
      rv << l.chomp
    end

    file.close
    rv
  end

  def write file_name, text
    file = File.open file_name, "w"
    file.write text
    file.close
  end
end