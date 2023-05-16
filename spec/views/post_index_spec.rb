require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Brazil.', posts_counter: 5)
    @first_post = Post.create(title: 'Hello there', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0, user_id: @user.id)

    Comment.create(text: 'Hi Lillian!', user_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'How are you?', user_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'You know Rails', user_id: @user.id, post_id: @first_post.id)
    visit user_post_path(@first_post.user, @first_post)
  end

  scenario 'displays post text' do
    expect(page).to have_content('This is my first post')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hi Lillian!')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 3')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end
end
