class CreateDSuppliers < ActiveRecord::Migration
  def change
    create_table :d_suppliers do |t|
      t.references :supplier
      t.references :product

      t.timestamps
    end
    add_index :d_suppliers, :supplier_id
    add_index :d_suppliers, :product_id
  end
end
