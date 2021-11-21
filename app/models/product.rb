class Product < ApplicationRecord
  attachment :product_image
  belongs_to :category
  enum is_active: { available: 0, un_available: 1}
end
