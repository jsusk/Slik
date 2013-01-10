class ReportsController < ApplicationController
  before_filter :require_login
  before_filter :require_administrador

  def index
    @requests = Request.where('recibido!=enviado and status=1 and updated_at>\'' + (Time.now.midnight - 1.month).to_s + '\'')
  end

end
