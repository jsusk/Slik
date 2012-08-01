class AddCantidadToDCombo < ActiveRecord::Migration
  def change
    add_column :d_combos, :cantidad, :integer
  end
end
