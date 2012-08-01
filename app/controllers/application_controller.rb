class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      f = Time.new.strftime("%Y-%m-%d")
      cart = Cart.create(:fecha=>f)
      session[:cart_id] = cart.id
      return cart
    end
end
