class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :user, foreign_key: true
      t.references :subgenre, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
