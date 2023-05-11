# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


10.times do 
  city = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Address.postcode)
end 


5.times do 
  user = User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    description: Faker::Quote.famous_last_words,
    city: City.order("RANDOM()").first, 
    age: Faker::Number.within(range: 21..101),
    password: "test"
  )
end 

gossips = []
10.times do |index|
  user = User.order("RANDOM()").first
  gossip = Gossip.create(
    title: Faker::Quotes::Shakespeare.hamlet,
    content: Faker::TvShows::BojackHorseman.quote,
    user: user
  )
  gossips << gossip
end 

10.times do |index|
  user = User.order("RANDOM()").first
  gossip = Gossip.create(
    title: Faker::Quotes::Shakespeare.as_you_like_it,
    content: Faker::Movies::LordOfTheRings.quote,
    user: user
  )
  gossips << gossip
end 

10.times do |index|
  user = User.order("RANDOM()").first
  gossip = Gossip.create(
    title: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    content: Faker::Movies::StarWars.quote,
    user: user
  )
  gossips << gossip
end 

tags = []
5.times do |index|
  gossip = Gossip.order("RANDOM()").first
  tag = Tag.create(title: ['bromance', 'hater', 'blabla', 'etc'].sample)
  tags << tag
end


gossips.each do |gossip|
  tags.sample(3).each do |tag|
    TagGossip.create(gossip_id: gossip.id, tag_id: tag.id)
  end
end


10.times do |index|
  recipient = User.order("RANDOM()").first
  sender = User.order("RANDOM()").last
  private_message = PrivateMessage.create(
    content: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 10),
    recipient: recipient,
    sender: sender
  )
end


20.times do |index|
  user = User.order("RANDOM()").first
  gossip = Gossip.order("RANDOM()").last
  comment = Comment.create(
    content: Faker::TvShows::RuPaul.quote,
    user_id: user.id,
    gossip_id: gossip.id
  )
end

20.times do |index|
  user = User.order("RANDOM()").first
  gossip = Gossip.order("RANDOM()").last
  comment = Comment.create(
    content: Faker::TvShows::TwinPeaks.quote,
    user_id: user.id,
    gossip_id: gossip.id
  )
end