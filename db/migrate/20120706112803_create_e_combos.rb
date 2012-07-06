class CreateECombos < ActiveRecord::Migration
  def change
    create_table :e_combos do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
