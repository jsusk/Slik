class DSupplier < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :product
  # attr_accessible :title, :body
end
