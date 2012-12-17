class AddTipoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tipo, :string
  end
end
