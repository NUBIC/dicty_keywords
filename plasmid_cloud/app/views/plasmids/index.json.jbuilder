json.array!(@plasmids) do |plasmid|
  json.extract! plasmid, :name, :ID, :keywords
  json.url plasmid_url(plasmid, format: :json)
end
