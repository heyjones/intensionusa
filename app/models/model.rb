class Model < ActiveRecord::Base
	belongs_to :make
	belongs_to :model
end