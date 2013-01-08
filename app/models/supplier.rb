class Supplier < ActiveRecord::Base
  
  validates :rfc, :presence => true
  validates :nombre,  :presence=>true
  
  
  attr_accessible :nombre, :rfc
  has_many :d_suppliers
  has_many :products, :through => :d_suppliers
end
