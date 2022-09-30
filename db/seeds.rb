# frozen_string_literal: true

user = User.create!(email: 'test@test.for', password: '123456')

3.times do
  Category.create!(name: Faker::Hobby.activity)
end

5.times do
  post = Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(sentense_count: 8, random_sentences_to_add: 10),
    category: Category.all.sample,
    creator: user
  )
  (0..5).to_a.sample.times do
    post.comments.create!(content: Faker::Lorem.sentence)
  end
end
