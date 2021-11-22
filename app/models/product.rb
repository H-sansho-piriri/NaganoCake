class Product < ApplicationRecord
  attachment :image
  def add_tax_price
    (self.price * 1.08).round
  end
  belongs_to :category

end
