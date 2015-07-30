class Dict
  def initialize(dictionary)
    @dictionary = dictionary.uniq
  end
  
  def find_combinations(word)
    result_combinations = []
    @dictionary.each do |part|
      if word.start_with? part
        if part == word
          result_combinations << "#{part}"
        else  
          new_word = word[part.length..(-1)]
          combinations = find_combinations(new_word)
          combinations.each{|item| result_combinations << "#{part} #{item}"} unless combinations.empty?
        end  
      end
    end  
    return result_combinations
  end  
end