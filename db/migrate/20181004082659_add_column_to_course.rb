class AddColumnToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :user_id, :integer, foreign_key: true
    add_column :courses, :title, :string
    add_column :courses, :description, :string
    add_column :courses, :picture, :string
  end
end
