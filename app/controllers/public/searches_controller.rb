class Public::SearchesController < ApplicationController
  
  def product_search
    @categories = Category.all
    @products = Product.search(params[:keyword]).page(params[:page]).per(5)
    @keyword = params[:keyword]
  end
end
