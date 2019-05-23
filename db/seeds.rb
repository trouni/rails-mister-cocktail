require 'open-uri'
require 'json'

Ingredient.destroy_all if Rails.env.development?

puts "Fetching ingredients from API"
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = JSON.parse(open(url).read)

puts "Creating ingredients..."
json["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
  print "#"
end
