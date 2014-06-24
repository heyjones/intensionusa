class PagesController < ApplicationController
  def index
  	@categories = Category.all
  	@materials = Material.all
  	@makes = Make.all
  	@products = ShopifyAPI::Product.find(:all)
  end
end