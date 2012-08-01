class DSale < ActiveRecord::Base
  belongs_to :product
  belongs_to :e_combo
  belongs_to :cart
  attr_accessible :cantidad, :product_id, :e_combo_id
  validates :cantidad, :numericality => true


  def total_price
    if product
      product.precio * cantidad
    else
      e_combo.precio * cantidad
    end
  end

end
