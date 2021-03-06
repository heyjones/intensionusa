metafields = Metafield.where(:product_type => @product_type)
json.array! @results do |product|
	json.id product.id
	json.vendor product.vendor
	json.title product.title
	json.image product.image.src
	json.price product.variants.first.price
	json.set! :metafields do
		meta = product.metafields
		metafields.each do |metafield|
			m = meta.select { |x| x.key.eql? metafield.key }
			if m.empty?
				json.set!(metafield.key, '')
			else
				json.set!(metafield.key, m.first.value)
			end
		end
	end
end