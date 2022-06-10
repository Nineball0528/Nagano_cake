class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
    waiting: 0,
    paid_up: 1,
    in_production: 2,
    preparing: 3,
    shipped: 4
  }
  def postage
    800
  end
end
