class Request < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :amount, :status, :recibido, :enviado, :product_id

  def product_name
    self.product.name
  end
end
