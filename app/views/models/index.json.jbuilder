json.array!(@models) do |model|
  json.extract! model, :id, :make_id, :material_id, :name, :price
  json.url model_url(model, format: :json)
end
