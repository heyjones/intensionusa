json.array! @products do |product|
	json.id product.id
	json.vendor product.vendor
	json.title product.title
	json.image product.image.src
	json.price 0.0
	json.set! :metafields do
		@metafields = Metafield.where(:product_type => @product_type)
		@metafields.each do |metafield|
			value = ShopifyAPI::Metafield.find(:first, :params=> { :resource => 'products', :resource_id => product.id, :namespace => 'seedcms', :key => metafield.key })
			if value.nil?
				json.set!(metafield.key, '')
			else
				json.set!(metafield.key, value.value)
			end
		end
	end
end