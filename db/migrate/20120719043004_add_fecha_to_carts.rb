class AddFechaToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :fecha, :date
  end
end
