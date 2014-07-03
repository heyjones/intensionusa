# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Subcategory.delete_all
['Road', 'Tandem', 'Commuter / Street', 'Mountain', 'Fixed Gear / Single Speed', 'Triathalon / Time Trials', 'Cyclocross', 'Hybrid', 'Cruiser', 'BMX'].each do |category|
	Category.create(name: category)
end
Category.all.each do |category|
	case category.name
	when 'Road'
		['700c', '650c', '27"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Tandem'
		['700c', '29er', '26"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Commuter / Street'
		['700c', '29er', '26"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Mountain'
		['650b', '29er', '26"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Fixed Gear / Single Speed'
		['700c'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Triathalon / Time Trials'
		['700c'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Cyclocross'
		['700c'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Hybrid'
		['700c'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'Cruiser'
		['26"', '24"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	when 'BMX'
		['26"', '24"', '20"'].each do |subcategory|
			Subcategory.create(category_id: category.id, name: subcategory)
		end
	end
end

Material.delete_all
['Alloy', 'Carbon', 'Steel', 'Aluminum', 'Brass', 'Nylon', 'Titanium'].each do |material|
	Material.create(name: material)
end

Metafield.delete_all
['Rims,size','Rims,height','Rims,width'].each do |metafield|
	product_type, key = metafield.chomp.split(',')
    Metafield.create(product_type: product_type, key: key)
end