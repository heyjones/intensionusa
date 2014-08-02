json.array!(@sizes) do |size|
  json.extract! size, :id, :category_id, :name
  json.url size_url(size, format: :json)
end
