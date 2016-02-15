json.array!(@coms) do |com|
  json.extract! com, :id, :text, :user_id, :art_id
  json.url com_url(com, format: :json)
end
