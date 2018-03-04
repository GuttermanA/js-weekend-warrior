class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cmc
      t.string :mana_cost
      t.string :color_identity
      t.string :full_type
      t.string :rarity
      t.integer :power
      t.integer :toughness
      t.string :img_url
      t.string :game_format
      t.timestamps
    end
  end
end
