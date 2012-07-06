class DCombo < ActiveRecord::Base
  belongs_to :ecombo
  belongs_to :product
  # attr_accessible :title, :body
end
