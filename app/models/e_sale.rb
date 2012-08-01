class ESale < ActiveRecord::Base
  has_many :d_sales
  attr_accessible :fecha

  def add_item_from_cart(cart)
    cart.d_sales.each do |item|
      item.cart_id = nil
      d_sales << item
    end
  end
end
