class Order < ActiveRecord::Base
  validates :cantidad, :presence => true, :numericality => true
  validates :factura, :presence => true
  validates :d_supplier_id, :presence => true

  #validates :precio,  :presence=>true, :numericality => true
  
  belongs_to :d_supplier
  attr_accessible :cantidad, :factura
end
