class Order < ActiveRecord::Base
  belongs_to :d_supplier
  attr_accessible :cantidad, :factura
end
