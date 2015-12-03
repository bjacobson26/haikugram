json.array!(@haikus) do |haiku|
  json.extract! haiku, :id, :title, :first_line, :second_line, :third_line
  json.url haiku_url(haiku, format: :json)
end
