class Gift < ActiveRecord::Base
	validates :cantidad, :presence => true, :numericality => true
	validates :motivo, :presence => true
	validates :product_id,  :presence=>true

	belongs_to :product
	belongs_to :user
	attr_accessible :cantidad, :motivo
end
