class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cantidad
      t.string :factura
      t.references :d_supplier

      t.timestamps
    end
    add_index :orders, :d_supplier_id
  end
end
