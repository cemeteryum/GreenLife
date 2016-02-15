json.array!(@arts) do |art|
  json.extract! art, :id, :title, :description, :user_id, :cat_id
  json.url art_url(art, format: :json)
end
