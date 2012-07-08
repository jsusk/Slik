class ESale < ActiveRecord::Base
  attr_accessible :fecha
	has_many :d_sales, :dependent => :destroy
	has_many :products, :through => :d_sales
end
