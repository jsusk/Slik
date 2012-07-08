class DSale < ActiveRecord::Base
  belongs_to :esale
  belongs_to :product
	attr_accessible :product
  # attr_accessible :title, :body
end
