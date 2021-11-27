class CartProduct < ApplicationRecord
  validates :quantity, numericality: { less_than_or_equal_to: 30, greater_than_or_equal_to: 1 }

  def subtotal
    product.add_tax_price * quantity
  end

  belongs_to :product
  belongs_to :customer
end
