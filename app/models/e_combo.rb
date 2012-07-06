class ECombo < ActiveRecord::Base
  attr_accessible :nombre, :precio
	has_many :d_combos
	has_many :products, :through => :d_combos

end
