class ChangeColumnToTestDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :test_details, :answer, :string
    add_column :test_details, :question, :string
    add_column :test_details, :user_test_id, :intger, foreign_key: true
  end
end
