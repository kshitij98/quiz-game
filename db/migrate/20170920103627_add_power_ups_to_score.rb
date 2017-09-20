class AddPowerUpsToScore < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :skip_question, :boolean
    add_column :scores, :double_points, :boolean
  end
end
