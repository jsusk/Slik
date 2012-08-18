class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :product
      t.integer :amount
      t.boolean :status
      t.references :user

      t.timestamps
    end
    add_index :requests, :product_id
    add_index :requests, :user_id
  end
end
