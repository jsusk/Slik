class AddESaleIdToDSale < ActiveRecord::Migration
  def change
   add_column :d_sales, :e_sale_id, :integer
   add_index :d_sales, :e_sale_id 
  end
end
