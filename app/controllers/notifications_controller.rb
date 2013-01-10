class NotificationsController < ApplicationController
  before_filter :require_login
  before_filter :require_dulcero

  def index
    @products = Product.where('cantDulc<minimo').order('cantDulc')
  end

end
