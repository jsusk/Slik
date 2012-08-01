class ESalesController < ApplicationController
  def create
    cart = current_cart
    @e_sale = ESale.new(:fecha=>cart.fecha)
    @e_sale.add_item_from_cart(cart)

    if @e_sale.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to new_d_sale_path, :flash=>{:success=>"Producto vendido"}
    end
  end
end
