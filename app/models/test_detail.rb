class TestDetail < ApplicationRecord
  belongs_to :user_test
  belongs_to :lesson
end
