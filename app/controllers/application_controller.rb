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

    def not_authenticated
    redirect_to login_url, :alert => "Es necesario iniciar sesion"
    end

    def require_dulcero
      usr = current_user
      if usr.tipo != "dulcero"
        redirect_to session_error_url
      end
    end

    def require_administrador
      usr = current_user
      if usr.tipo != "administrador"
        redirect_to session_error_url
      end
    end

    def require_almacen
      usr = current_user
      if usr.tipo != "almacen"
        redirect_to session_error_url
      end
    end


    
end
