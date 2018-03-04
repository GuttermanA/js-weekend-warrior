class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :card_count
      t.string :format
      t.timestamps
    end
  end
end
