class ChangeColumnToLesson < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :course_id, :intger, foreign_key: true
  end
end
