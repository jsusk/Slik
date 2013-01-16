class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.references :product
      t.references :user
      t.integer :cantidad
      t.text :motivo

      t.timestamps
    end
    add_index :gifts, :product_id
    add_index :gifts, :user_id
  end
end
