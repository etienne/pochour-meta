# Communities
5.times do |i|
  Community.create(
    name: Faker::Commerce.department, 
    public: rand(0...1)
  )
end

# Main user
User.create(
  name: "Étienne Després", 
  email: "test@example.com", 
  password: "testtest",
  password_confirmation: "testtest",
  community_ids: [1, 2, 3, 4, 5]
)

# Users
9.times do |i|
  password = Faker::Internet.password;
  User.create(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password,
    community_ids: [rand(1...5)]
  )
end

# Articles
25.times do |i|
  user = User.find(rand(1...10))
  Article.create(
    title: Faker::Company.catch_phrase,
    body: "<p>#{Faker::Lorem.paragraphs(rand(3...6)).join('</p><p>')}</p>",
    user: user,
    community: user.communities.first,
    created_at: Faker::Time.backward(200)
  )
end

# Comments
50.times do |i|
  article = Article.find(rand(1...25))
  user = article.community.users.sample
  Comment.create(
    body: "<p>#{Faker::Lorem.paragraph}</p>",
    user: user,
    article: article,
    created_at: Faker::Time.between(article.created_at, Date.today)
  )
end

# Epithets
15.times do |i|
  Epithet.create(name: Faker::Lorem.word)
end

# Epithet Votes
30.times do |i|
  EpithetVote.create(
    user_id: rand(1...10),
    article_id: rand(1...25),
    epithet_id: rand(1...15)
  )
end