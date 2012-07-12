class ECombo < ActiveRecord::Base
  attr_accessible :nombre, :precio , :d_combos_attributes

  validates :nombre, :presence => true
  validates :precio, :numericality => true
	
  has_many :d_combos, :dependent => :destroy
  accepts_nested_attributes_for :d_combos, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true

	has_many :products, :through => :d_combos

end
