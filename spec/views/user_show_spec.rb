require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Mexico.', posts_counter: 5)

    Post.create(user: @user, title: 'Hello there', text: 'This is my first post')
    Post.create(user: @user, title: 'Hello microverse', text: 'This is my second post')
    Post.create(user: @user, title: 'Hello Rails', text: 'This is my third post')
    @post = Post.create(user: @user, title: 'Hello Ruby', text: 'This is my fourth post')

    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    save_and_open_page
    expect(page).to have_css("img[src='https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=']", wait: 30)
  end

  it 'should displays static text' do
    expect(page).to have_content('Posts')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should render three recent posts' do
    expect(page).to have_content(@user.recent_three_posts[0])
    expect(page).to have_content(@user.recent_three_posts[1])
    expect(page).to have_content(@user.recent_three_posts[2])
    expect(page).to have_no_content(Post.where(user: @user))
  end
end