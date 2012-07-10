class DCombo < ActiveRecord::Base
  belongs_to :ecombo
  belongs_to :product
  attr_accessible :e_combo_id, :product_id
  # attr_accessible :title, :body
end
