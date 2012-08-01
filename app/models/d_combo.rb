class DCombo < ActiveRecord::Base
  belongs_to :ecombo
  belongs_to :product

  attr_accessible :e_combo_id, :product_id, :cantidad
  
  validates :cantidad, :numericality => true
  validates :cantidad, :presence => true

  # attr_accessible :title, :body
end
