require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(
    name: 'Doe', photo: 'https://doe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )

  post = Post.create(
    title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0, user_id: user.id
  )

  like = Like.create(post:, user:)

  context 'update_likes_counter' do
    like.update_likes_counter

    it 'increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end
