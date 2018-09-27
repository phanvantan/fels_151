class CreateLessonQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_questions do |t|
      t.references :question, foreign_key: true
      t.references :lesson, foreign_key: true
      t.timestamps
    end
  end
end
