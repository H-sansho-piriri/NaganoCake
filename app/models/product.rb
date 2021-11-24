class Product < ApplicationRecord
  attachment :image
  def add_tax_price
    (self.price * 1.1).floor
  end
  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :order_details
end
