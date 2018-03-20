class CreateCardFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :card_formats do |t|
      t.integer :card_id
      t.integer :format_id
      t.boolean :legal
      t.timestamps
    end
  end
end
