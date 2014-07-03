class ShopifyController < ApplicationController

	def products
		@products = ShopifyAPI::Product.find(:all)
		render :json => @products
	end

	def product
		@product = ShopifyAPI::Product.find(params[:id])
		@metafields = Metafield.where(:product_type => @product.product_type)
		respond_to do |format|
			format.html { render action: 'product' }
			format.json { render :json => @product }
		end
		
	end

  def savings_calculator
  	@models = Model.filter(params)
	@model = @models.first
  	render :json => @model.to_json(:include => [ :make, :model_products ])
  end

  def find_your_wheelset
	@products = ShopifyAPI::Product.find(:all)
  	render :json => @products
  end

  def wheel_customizer
  end

end