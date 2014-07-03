class ProductsController < ApplicationController
  def index
  	@product_types = ShopifyAPI::Product.find(:all).map(&:product_type).uniq
  	@products = ShopifyAPI::Product.find(:all)
  end

  def show
  	@product = ShopifyAPI::Product.find(params[:id])
  	@metafields = Metafield.where(:product_type => @product.product_type)
  end

  def update
  	@product = ShopifyAPI::Product.find(params[:id])
  	@product.metafields.each do |metafield|
  		metafield.destroy
  	end
  	metafields = params[:seedcms]
  	metafields.each do |metafield|
  		product = ShopifyAPI::Product.find(params[:id])
  		product.add_metafield(ShopifyAPI::Metafield.new({
			:description => '',
			:namespace => 'seedcms',
			:key => metafield[0],
			:value => metafield[1],
			:value_type => 'string'
		}))
  	end
  	redirect_to '/products/'+params[:id], notice: 'Product was successfully updated.'
  end

end