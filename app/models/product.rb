class Product < ApplicationRecord
  attachment :image
  def add_tax_price
    (self.price * 1.1).floor
  end
  belongs_to :category
  has_many :cart_products, dependent: :destroy

  validates :name, presence: true
  validates :caption, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

end
