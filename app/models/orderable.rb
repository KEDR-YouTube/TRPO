class Orderable < ApplicationRecord
  belongs_to :ecomm
  belongs_to :cart
  def total
    ecomm.price * quantity
  end
end
