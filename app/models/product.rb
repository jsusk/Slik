class Product < ActiveRecord::Base
  attr_accessible :name, :precio
	validates :name, :presence => true
	validates :precio, :numericality => true
end
