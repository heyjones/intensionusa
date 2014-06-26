class ShopifyController < ApplicationController

	def products
		@products = ShopifyAPI::Product.find(:all)
		render :json => @products
	end

	def product
		@product = ShopifyAPI::Product.find(params[:id])
		render :json => @product
	end

  def savings_calculator
  	@models = Model.filter(params)
	@model = @models.first
  	render :json => @model.to_json(:include => [ :make, :model_products ])
  end

  def find_your_wheelset
  	if params.has_key?(:price)
  		@products = ShopifyAPI::Product.find(:all)
  	else
  		@products = ShopifyAPI::Product.find(:all)
  	end
  	render :json => @products
  end

  def wheel_customizer
  end

end