json.array!(@metafields) do |metafield|
  json.extract! metafield, :id, :product_type, :description, :key, :namespace, :value, :value_type
  json.url metafield_url(metafield, format: :json)
end
