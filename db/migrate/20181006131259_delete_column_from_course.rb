class DeleteColumnFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :picture
  end
end
