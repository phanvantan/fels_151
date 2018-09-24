class Wordlist1 < ApplicationRecord
    has_one :learned
    accepts_nested_attributes_for :learned 
    validates :name, :word1, :word2, :word3, :word4, :word5, presence: true
end
