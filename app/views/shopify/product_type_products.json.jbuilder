metafields = Metafield.where(:product_type => @product_type)
json.array! @products do |product|
	json.id product.id
	json.vendor product.vendor
	json.title product.title
	json.image product.image.src
	json.price 0.0
	json.set! :metafields do
		metafields.each do |metafield|
			meta = product.metafields.select { |x| x.key.eql? metafield.key }
			if meta.empty?
				json.set!(metafield.key, '')
			else
				json.set!(metafield.key, meta.first.value)
			end
		end
	end
end