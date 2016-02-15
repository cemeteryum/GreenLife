json.array!(@hits) do |hit|
  json.extract! hit, :id, :text, :user_id, :chal_id
  json.url hit_url(hit, format: :json)
end
