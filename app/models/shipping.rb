class Shipping < ApplicationRecord


  belongs_to :customer

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true

end
