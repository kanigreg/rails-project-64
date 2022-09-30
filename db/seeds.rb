# frozen_string_literal: true

user = User.create!(email: 'test@test.for', password: '123456')

3.times do
  Category.create!(name: Faker::Hobby.activity)
end

5.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(random_sentences_to_add: 10),
    category: Category.all.sample,
    creator: user
  )
end
