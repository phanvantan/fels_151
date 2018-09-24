class Learned < ApplicationRecord
  belongs_to :wordlist1
  validates :name, :word1, :word2, :word3, :word4, :word5, presence: true
end
