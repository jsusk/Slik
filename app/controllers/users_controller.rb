class UsersController < ApplicationController
  before_filter :require_login
  before_filter :require_administrador

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    #render :text => params.inspect
    if @user.save
     redirect_to users_path, :flash=>{:success=>"Usuario dado de alta"}
    else
       render :new 
    end
  end
end
