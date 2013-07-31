json.array!(@keywords) do |keyword|
  json.extract! keyword, :word, :frequency, :plasmids
  json.url keyword_url(keyword, format: :json)
end
