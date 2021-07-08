require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database"

Article.destroy_all
User.destroy_all

puts "Creating 3 users"

user1 = User.create!(
  email: 'user1@test.com',
  password: 'azerty'
)

user2 = User.create!(
  email: 'user2@test.com',
  password: 'azerty'
)

user3 = User.create!(
  email: 'user3@test.com',
  password: 'azerty'
)

puts "Creating 10 articles"

10.times do
  article = Article.new(
    title: Faker::Movies::BackToTheFuture.quote,
    rich_body: Faker::Lorem.paragraph(sentence_count: 10),
    user: [user1, user2, user3].sample
    )
  file = URI.open('https://source.unsplash.com/random/800x600')
  article.photo.attach(io: file, filename: 'article_image.jpg', content_type: 'image/jpg')
  article.save!
end

puts "Seed is ok!"
