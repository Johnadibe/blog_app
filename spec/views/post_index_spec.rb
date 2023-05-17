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

    @first_post.update(comments_counter: @first_post.comments.count)
    @first_post.update(likes_counter: @first_post.likes.count)
    @user.update(posts_counter: @user.posts.count)

    visit user_posts_path(@first_post.user, @first_post)
  end

  scenario 'should render user profile photo' do
    expect(page).to have_css(
      "img[src='#{@user.photo}']", wait: 30
    )
  end

  scenario 'should display user name' do
    expect(page).to have_content(@user.name)
  end

  scenario 'shows number of user posts' do
    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
  end

  scenario 'render button section for Pagination' do
    expect(page).to have_button('Pagination')
  end

  scenario 'redirects to the post show page' do
    click_link('a', match: :first)
    expect(page).to have_content(@first_post.title)
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
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end
end
