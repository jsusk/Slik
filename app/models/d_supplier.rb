class DSupplier < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :product
  has_many :orders
  # attr_accessible :title, :body
end
