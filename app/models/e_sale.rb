class ESale < ActiveRecord::Base
  has_many :d_sales
  attr_accessible :fecha

  def add_item_from_cart(cart)
    cart.d_sales.each do |item|
      if item.product  
        puts "================PRODUCTO==============="
        item.product.cantDulc -= item.cantidad
        item.product.save
      elsif item.e_combo
        puts "===============COMBO==================="
        item.e_combo.products.each do |p|
          puts "=======================>" + p.id.to_s
          p.cantDulc -= item.cantidad
          p.save
        end
      end
      item.cart_id = nil
      d_sales << item
    end
  end
end
