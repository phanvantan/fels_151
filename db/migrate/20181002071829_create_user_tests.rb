class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|

      t.timestamps
    end
  end
end
