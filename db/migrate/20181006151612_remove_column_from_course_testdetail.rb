class RemoveColumnFromCourseTestdetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :user_id
    remove_column :test_details, :user_id
    remove_column :test_details, :answer_id
  end
end
