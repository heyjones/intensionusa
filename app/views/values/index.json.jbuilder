json.array!(@values) do |value|
  json.extract! value, :id, :metafield_id, :name
  json.url value_url(value, format: :json)
end
