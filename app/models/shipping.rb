class Shipping < ApplicationRecord
<<<<<<< HEAD
  belongs_to :customer
=======
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
>>>>>>> PublicOreders/new
end
