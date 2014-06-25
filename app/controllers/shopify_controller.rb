class ShopifyController < ApplicationController

  def savings_calculator
  	@model = Model.first
  	#@products = ShopifyAPI::Product.find(:all, :params => {:limit => 3})
  	render :json => @model.to_json(:include => :model_products)
  end

  def find_your_wheelset
  end

  def wheel_customizer
  end

end