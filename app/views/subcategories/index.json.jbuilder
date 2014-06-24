json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :category_id, :name
  json.url subcategory_url(subcategory, format: :json)
end
