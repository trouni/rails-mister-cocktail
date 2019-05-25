require 'open-uri'
require 'json'
require 'faker'

puts "Deleting records from database..."
Cocktail.destroy_all # if Rails.env.development?
Ingredient.destroy_all # if Rails.env.development?

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
puts "Creating cocktails..."
30.times do
  cocktail = Cocktail.new(name: Cocktail.generate_name)
  cocktail.remote_photo_url = Cocktail.generate_photo_url
  cocktail.save
  print "#"
end

puts ""
puts "Adding ingredients to cocktails..."

Cocktail.all.each do |cocktail|
  (rand(2..7)).times do
    parts = rand(1..8)
    Dose.create(cocktail: cocktail, ingredient: Ingredient.all.sample, description: "#{parts} #{'part'.pluralize(parts)}")
  end
  print "#"
end

puts ""
puts "Creating reviews..."

20.times do
  cocktail = Cocktail.all.sample
  puts ""
  puts "Reviewing #{cocktail.name}"
  number_of_reviews = rand(100)
  number_of_reviews.times do
    review = Review.new(
      rating: [5, rand(1..5) + rand(number_of_reviews) / 20].min,
      description: [Faker::Coffee.notes, Faker::Restaurant.review, Faker::Quote.most_interesting_man_in_the_world, Faker::TvShows::HowIMetYourMother.quote].sample
    )
    review.cocktail = cocktail
    review.save!
    print "#"
  end

end
