class ReportsController < ApplicationController
  before_filter :require_login
  before_filter :require_administrador, :except=>[:corte_diario,:corte_mensual, :mensual, :diario]
  before_filter :require_almacen, :only => [:corte_diario, :corte_mensual, :mensual, :diario]

  def index
    @requests = Request.where('recibido!=enviado and status=1 and MONTH(DATE(CONVERT_TZ(updated_at,"+00:00","-06:00") ))=\'' + (Time.now.month).to_s + '\'')
  end

  def diario
      fecha = params[:date]
      @resultado = []

      Product.all.each do |p|
        fila = {}
        fila[:nombre] = p.name
        fila[:final] = p.cantDulc
        fila[:cantidad] = DSale.where("DATE(CONVERT_TZ(created_at,'+00:00','-06:00')) = ? and product_id = ?",fecha,p.id).sum("cantidad")
        fila[:inicial] = fila[:final] + fila[:cantidad]
        fila[:costo] = p.precio

        @resultado << fila
      end
      @combos = []

      ECombo.all.each do |c|
        fila = {}
        fila[:nombre] = c.nombre
        fila[:cantidad] =  DSale.where("DATE(CONVERT_TZ(created_at,'+00:00','-06:00')) = ? and e_combo_id = ?",fecha,c.id).sum("cantidad")
        fila[:costo] = c.precio
        @combos << fila
      end
  end

def mensual
      fecha = params[:date]
      @resultado = []

      Product.all.each do |p|
        fila = {}
        fila[:nombre] = p.name
        fila[:final] = p.cantDulc
        fila[:cantidad] = DSale.where("(CONVERT_TZ(created_at,'+00:00','-06:00') between DATE_FORMAT(?, '%Y-%m-01') and LAST_DAY(?)) and product_id = ?",fecha,fecha,p.id).sum("cantidad")
        fila[:inicial] = fila[:final] + fila[:cantidad]
        fila[:costo] = p.precio

        @resultado << fila
      end
      @combos = []

      ECombo.all.each do |c|
        fila = {}
        fila[:nombre] = c.nombre
       fila[:cantidad] = DSale.where("(CONVERT_TZ(created_at,'+00:00','-06:00') between DATE_FORMAT(?, '%Y-%m-01') and LAST_DAY(?)) and e_combo_id = ?",fecha,fecha,c.id).sum("cantidad")
        fila[:costo] = c.precio
        @combos << fila
      end
  end

  def corte_diario
  end

  def corte_mensual

  end



  

end
