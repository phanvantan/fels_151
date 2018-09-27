class ChangeColumnToTestDetail < ActiveRecord::Migration[5.2]
  def change
    change_column :test_details, :answer, :string
    change_column :test_details, :user_test_id, :intger, foreign_key: true
    change_column :test_details, :lesson_id, :intger, foreign_key: true
  end
end
