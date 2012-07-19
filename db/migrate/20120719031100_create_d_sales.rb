class CreateDSales < ActiveRecord::Migration
  def change
    create_table :d_sales do |t|
      t.integer :cantidad
      t.references :product
      t.references :e_combo
      t.references :cart

      t.timestamps
    end
    add_index :d_sales, :product_id
    add_index :d_sales, :e_combo_id
    add_index :d_sales, :cart_id
  end
end
