class CreateCards < ActiveRecord::Migration[5.1]
  # ORIGINAL CREATE FOR standard_cards
  # def change
  #   create_table :cards do |t|
  #     t.string :name
  #     t.integer :cmc
  #     t.string :mana_cost
  #     t.string :color_identity
  #     t.string :base_type
  #     t.string :rarity
  #     t.integer :power
  #     t.integer :toughness
  #     t.string :text
  #     t.string :img_url
  #     t.string :game_format
  #     t.timestamps
  #   end
  # end
  def change
    create_table :cards do |t|
      t.string :name
      t.string :mana_cost
      t.integer :cmc
      t.string :full_type
      t.string :rarity
      t.string :text
      t.string :flavor
      t.string :artist
      t.integer :collector_number
      t.integer :power
      t.integer :toughness
      t.integer :loyalty
      t.string :img_url
      t.integer :mtg_set_id
    end
  end
end
