class CreateESales < ActiveRecord::Migration
  def change
    create_table :e_sales do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
