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
  	if params[:material_id]
  		@model = Model.first
  	else
  		@model = Model.last
  	end
  	render :json => @model.to_json(:include => [ :make, :model_products ])
  end

  def find_your_wheelset
  end

  def wheel_customizer
  end

end