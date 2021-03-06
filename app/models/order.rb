class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1}

  enum status: { payment_waiting: 0, payment_cofirm: 1, making_now: 2, preparing_delivery: 3, shipped: 4 }
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  def add_tax_price
    (self.price * 1.1).floor
  end

  validates :payment_method, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
end
