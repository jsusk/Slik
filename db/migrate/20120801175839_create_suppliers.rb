class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :rfc
      t.string :nombre

      t.timestamps
    end
  end
end
