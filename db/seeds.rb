require 'open-uri'
require 'json'
require 'faker'

Cocktail.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?

puts ""
puts "Fetching ingredients from API"
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = JSON.parse(open(url).read)

puts "Creating ingredients..."
json["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
  print "#"
end

puts ""
puts "Creating cocktail names..."
50.times do
  Cocktail.create(name: Cocktail.generate_name)
  print "#"
end

puts ""
puts "Adding ingredients to cocktails..."

Cocktail.all.each do |cocktail|
  (rand(2..7)).times do
    Dose.create(cocktail: cocktail, ingredient: Ingredient.all.sample, description: "#{rand(1..8)} parts")
  end
  print "#"
end
