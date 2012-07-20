class Cart < ActiveRecord::Base
  has_many :d_sales, :dependent => :destroy
  attr_accessible :fecha

  def total_price
    d_sales.to_a.sum{|item| item.total_price}
  end
    
  def add_product(item_id, tipo, cantidad)
    if tipo == "combo"
      current_item = d_sales.find_by_e_combo_id(item_id)
      if current_item
        current_item.cantidad += cantidad.to_i
      else
        current_item=d_sales.build(:e_combo_id=>item_id, :cantidad=>cantidad)
      end
    else
      current_item = d_sales.find_by_product_id(item_id)
      if current_item
        current_item.cantidad += cantidad.to_i
      else
        current_item=d_sales.build(:product_id=>item_id, :cantidad=>cantidad)
      end
    end
    current_item
  end

end
