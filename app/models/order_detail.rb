class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: { start_impossible: 0, waiting: 1, coming_soon: 2, now_on_air: 3 }

end
