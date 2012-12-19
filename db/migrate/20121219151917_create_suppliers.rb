class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :nombre
      t.string :rfc

      t.timestamps
    end
  end
end
