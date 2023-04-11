# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
articles_data = [
  { title: "Article 1", content: "This is the content of article 1" },
  { title: "Article 2", content: "This is the content of article 2" },
  # Add more articles as needed
]

articles_data.each do |article_data|
  Article.create!(article_data)
end
