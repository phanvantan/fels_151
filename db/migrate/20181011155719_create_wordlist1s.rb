class CreateWordlist1s < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlist1s do |t|
      t.string :name
      t.string :word1
      t.string :word2
      t.string :word3
      t.string :word4
      t.string :word5

      t.timestamps
    end
  end
end
