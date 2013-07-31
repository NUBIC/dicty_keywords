json.array!(@keywords) do |keyword|
  json.extract! keyword, :word, :frequency, :strains
  json.url keyword_url(keyword, format: :json)
end
