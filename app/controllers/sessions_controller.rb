class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password])
    if user 
      redirect_back_or_to users_path, :notice => "Logged in!" 
    else
      flash.now.alert = "Usuario o password invalido."
      render :new 
    end
  end
  def destroy
    logout
    redirect_to users_path, :notice => "Logged out!"
  end
end
