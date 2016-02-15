json.array!(@chals) do |chal|
  json.extract! chal, :id, :name, :reg, :dur, :user_id, :cat_id
  json.url chal_url(chal, format: :json)
end
