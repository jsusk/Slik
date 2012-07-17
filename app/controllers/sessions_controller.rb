class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password])
    if user 
      redirect_back_or_to users_path, :success => "Logged in!" 
    else
      flash.now[:error] = "Usuario o password invalido."
      render :new 
    end
  end
  def destroy
    logout
    redirect_to users_path, :success => "Logged out!"
  end
end
