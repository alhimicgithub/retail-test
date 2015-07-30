require 'test_helper'
require 'models/dict'

describe Dict do 
  context 'success' do
    before :each do
      @dict =  Dict.new(['a', 'b', 'c', 'ab', 'abc'])
    end

    it "shuld get propriate results"  do
      expect(@dict.find_combinations('aabc')).to match_array ['a abc', 'a a b c', 'a ab c']
    end

    it "shuld get propriate result"  do
      expect(@dict.find_combinations('aabx')).to eq []
    end  
  end
end