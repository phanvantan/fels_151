class RemoveColumnFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :lesson_id
  end
end
