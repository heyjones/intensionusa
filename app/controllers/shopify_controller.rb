class ShopifyController < ApplicationController

	def product_types
		@product_types = ShopifyAPI::Product.find(:all).map(&:product_type).uniq
		render :json => @product_types
	end
	def product_type_products
		@product_type = params[:product_type]
		@products = ShopifyAPI::Product.find(:all, :params => {:product_type => @product_type})
		#render :json => @products
		#format.json { render action: 'product_type_products' }
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

	products = @products.to_a
	products.reject! { |p| p.variants.first.price.to_i < params[:price_low].to_i }
	products.reject! { |p| p.variants.first.price.to_i > params[:price_high].to_i }

	params.each do |param|
		logger.info param
	end

  	render :json => @products

  end

  def wheel_customizer
  end

end