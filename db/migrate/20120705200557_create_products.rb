class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :precio
      t.integer :cantDulc
      t.integer :cantAlm
      t.integer :minimo
      t.timestamps
    end
  end
end
