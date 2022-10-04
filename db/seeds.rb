# frozen_string_literal: true

ActiveRecord::Base.transaction do
  user = User.create!(email: 'test@test.for', password: '123456')

  5.times do
    User.create!(email: Faker::Internet.email, password: 'password')
  end

  3.times do
    Category.create!(name: Faker::Hobby.activity)
  end

  5.times do
    Post.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph(sentence_count: 8, random_sentences_to_add: 10),
      category: Category.all.sample,
      creator: user
    )
  end

  10.times do
    PostComment.create!(
      content: Faker::Lorem.sentence,
      post: Post.all.sample,
      user: User.all.sample
    )
  end

  5.times do
    comment = PostComment.all.sample
    comment.children.create!(
      content: Faker::Lorem.sentence,
      post_id: comment.post_id,
      user_id: comment.user_id
    )
  end
end
