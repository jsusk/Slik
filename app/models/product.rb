class Product < ActiveRecord::Base
  attr_accessible :name, :precio
	validates :name, :presence => true
	validates :precio, :numericality => true
	#Relacion con los combos
	has_many :d_combos
	has_many :e_combos, :through => :d_combos
	#Relacion con las ventas
	has_many :d_sales
	has_many :e_sales, :through => :d_sales
end
