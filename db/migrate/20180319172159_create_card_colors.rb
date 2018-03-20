class CreateCardColors < ActiveRecord::Migration[5.1]
  def change
    create_table :card_colors do |t|
      t.integer :card_id
      t.integer :color_id
      t.timestamps
    end
  end
end
