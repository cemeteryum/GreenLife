json.array!(@treats) do |treat|
  json.extract! treat, :id, :name, :md, :sym, :reg, :user_id, :cat_id
  json.url treat_url(treat, format: :json)
end
