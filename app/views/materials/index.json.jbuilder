json.array!(@materials) do |material|
  json.extract! material, :id, :name
  json.url material_url(material, format: :json)
end
