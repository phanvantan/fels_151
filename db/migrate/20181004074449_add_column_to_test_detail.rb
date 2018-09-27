class AddColumnToTestDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :test_details, :user_id, :integer
    add_column :test_details, :lesson_id, :integer, foreign_key: true
    add_column :test_details, :answer_id, :integer
  end
end
