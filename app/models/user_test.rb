class UserTest < ApplicationRecord
  has_many :test_details, dependent: :destroy
  has_many :lessons, through: :test_details
  scope :find_user_test_id, -> user_id {where user_id: user_id}
end
