class PagesController < ApplicationController
  def index
  	@categories = Category.all
  	@materials = Material.all
  	@makes = Make.all
  	@products = ShopifyAPI.throttle { ShopifyAPI::Product.find(:all) }
  	@metafields = Metafield.uniq.pluck(:product_type)
  end
end