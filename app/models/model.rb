class Model < ActiveRecord::Base
	belongs_to :make
	belongs_to :model
	has_many :model_products
end