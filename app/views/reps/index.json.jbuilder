json.array!(@reps) do |rep|
  json.extract! rep, :id, :text, :user_id, :treat_id, :p_id
  json.url rep_url(rep, format: :json)
end
