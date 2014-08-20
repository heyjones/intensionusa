class Product < ShopifyAPI::Product
	def self.types()
		self.find(:all).map(&:product_type).uniq
	end
end