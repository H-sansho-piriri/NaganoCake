class Order < ApplicationRecord
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1}
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end



end
