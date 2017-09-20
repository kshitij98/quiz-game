class AddQuestionToScore < ActiveRecord::Migration[5.1]
  def change
    add_reference :scores, :question, foreign_key: true
  end
end
