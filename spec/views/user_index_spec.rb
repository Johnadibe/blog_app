require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Mexico.', posts_counter: 5)
    @user2 = User.create(name: 'Bobby', photo: 'https://media.gettyimages.com/id/1250238624/nl/foto/handsome-young-adult-businessman-with-stubble.jpg?s=612x612&w=0&k=20&c=Ahojmst5H08S3yL7kaEj5mN3V8Weguk1V2pWDf4aH2Q=',
                         bio: 'Teacher from Brazil.', posts_counter: 3)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit user_path(id: @user.id)
    # rubocop:disable Lint/Debugger
    save_and_open_page
    # rubocop:enable Lint/Debugger
    # rubocop:disable Layout/LineLength
    expect(page).to have_css(
      "img[src='https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=']", wait: 30
    )
    # rubocop:enable Layout/LineLength

    visit user_path(id: @user2.id)
    # rubocop:disable Lint/Debugger
    save_and_open_page
    # rubocop:enable Lint/Debugger
    # rubocop:disable Layout/LineLength
    expect(page).to have_css(
      "img[src='https://media.gettyimages.com/id/1250238624/nl/foto/handsome-young-adult-businessman-with-stubble.jpg?s=612x612&w=0&k=20&c=Ahojmst5H08S3yL7kaEj5mN3V8Weguk1V2pWDf4aH2Q=']", wait: 30
    )
    # rubocop:enable Layout/LineLength
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name, match: :first)
    expect(page).to have_content(@user.name)
  end
end
