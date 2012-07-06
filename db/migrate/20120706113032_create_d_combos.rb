class CreateDCombos < ActiveRecord::Migration
  def change
    create_table :d_combos do |t|
      t.references :e_combo
      t.references :product

      t.timestamps
    end
    add_index :d_combos, :e_combo_id
    add_index :d_combos, :product_id
  end
end
