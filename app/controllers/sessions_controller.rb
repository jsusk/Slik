class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password])
    if user
      case user.tipo
        when "dulcero"
          redirect_back_or_to new_d_sale_path, :success => "Logged in"
        when "almacen"
          redirect_back_or_to "/requests/index_alm", :success => "Logged in"
        else 
          redirect_back_or_to users_path, :success => "Logged in"
       end
    else
      flash.now[:error] = "Usuario o password invalido."
      render :new 
    end
  end
  def destroy
    logout
    redirect_to users_path, :flash =>{:success => "Logged out!"}
  end
end
