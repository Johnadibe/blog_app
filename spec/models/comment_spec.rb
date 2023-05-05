require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(
    name: 'Doe', photo: 'https://doe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )

  post = Post.create(
    title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0, user_id: user.id
  )

  comment = Comment.create(post:, user:)

  context 'update_comments_counter' do
    comment.update_comments_counter

    it 'increment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
  end
end
