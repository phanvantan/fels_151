class AddColumnToUserTest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tests, :user_id, :integer, foreign_key: true
    add_column :user_tests, :test_day, :datetime
    add_column :user_tests, :result, :integer
  end
end
