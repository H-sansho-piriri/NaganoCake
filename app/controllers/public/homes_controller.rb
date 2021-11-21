class Public::HomesController < ApplicationController
  def top
    @categories = Category.all
    @products = Product.limit(4).order(created_at: :desc)
  end

  def about
  end
end
