require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
    it 'body should includes correct placeholder text' do
      expect(response.body).to include('A User Posts')
    end
  end
end
