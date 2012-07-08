class CreateDSales < ActiveRecord::Migration
  def change
    create_table :d_sales do |t|
      t.references :e_sale
      t.references :product

      t.timestamps
    end
    add_index :d_sales, :e_sale_id
    add_index :d_sales, :product_id
  end
end
