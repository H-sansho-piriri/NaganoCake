class Product < ApplicationRecord
  attachment :product_image
  def add_tax_price
    (self.price * 1.08).round
  end
  belongs_to :category
  enum is_active: { available: 0, un_available: 1}
end
