class ReportsController < ApplicationController
  before_filter :require_login
  before_filter :require_administrador

  def index
    @requests = Request.where('recibido!=enviado and status=1 and updated_at>\'' + (Time.now.midnight - 1.month).to_s + '\'')
  end

  def show
      fecha = params[:id]
      @resultado = []

      Product.all.each do |p|
        fila = {}
        fila[:nombre] = p.name
        fila[:final] = p.cantDulc
        fila[:cantidad] = DSale.where("DATE(created_at) = ? and product_id = ?",fecha,p.id).sum("cantidad")
        fila[:inicial] = fila[:final] + fila[:cantidad]
        fila[:costo] = p.precio

        @resultado << fila
      end
      @combos = []

      ECombo.all.each do |c|
        fila = {}
        fila[:nombre] = c.nombre
        fila[:cantidad] =  DSale.where("DATE(created_at) = ? and e_combo_id = ?",fecha,c.id).sum("cantidad")
        fila[:costo] = c.precio
        @combos << fila
      end

    


  end



  

end
