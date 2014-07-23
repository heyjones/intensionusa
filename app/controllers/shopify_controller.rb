class ShopifyController < ApplicationController

	def product_types
		@product_types = ShopifyAPI::Product.find(:all).map(&:product_type).uniq
		render :json => @product_types
	end
	def product_type_products
		@products = ShopifyAPI::Product.find(:all, :params => {:product_type => params[:product_type]})
		render :json => @products
	end

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

	def metafields
		@metafields = Metafield.where(:product_type => params[:product_type])
		render :json => @metafields.to_json(:include => :values)
	end

  def savings_calculator
  	@models = Model.filter(params)
	@model = @models.first
  	render :json => @model.to_json(:include => [ :make, :model_products ])
  end

  def find_your_wheelset
	@products = ShopifyAPI::Product.find(:all, :params => {:product_type => 'Wheelsets'})
	@products.each do |product|
		product.metafields.each do |metafield|
		
  		end
	end
  	render :json => @products
  end

  def wheel_customizer
  end

end