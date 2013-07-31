json.array!(@strains) do |strain|
  json.extract! strain, :name, :ID, :keywords
  json.url strain_url(strain, format: :json)
end
