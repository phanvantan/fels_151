class CreateLesson < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :course_id, foreign_key: true
      t.string :title
    end
  end
end
