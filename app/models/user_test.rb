class UserTest < ApplicationRecord
  has_many :test_details, dependent: :destroy
  has_many :lessons, through: :test_details
end
