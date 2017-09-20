class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :option1
      t.text :option2
      t.text :option3
      t.text :option4
      t.text :answer
      t.references :subgenre, foreign_key: true

      t.timestamps
    end
  end
end
