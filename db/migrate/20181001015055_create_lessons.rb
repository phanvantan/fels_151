class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :courseid
      t.string :title

      t.timestamps
    end
  end
end
