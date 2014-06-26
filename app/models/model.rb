class Model < ActiveRecord::Base
	belongs_to :make
	belongs_to :model
	has_many :model_products
	def self.filter(params)
		filter = self.scoped
		filter = filter.where(:material_id => params[:material_id]) if params[:material_id]
		filter
	end
end