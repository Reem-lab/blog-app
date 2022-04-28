require 'rails_helper'

RSpec.describe 'posts controllers', type: :request do
  before :each do
    get '/users/:user_id/posts'
  end

  it 'List all posts for all users status it will be ok' do
    expect(response).to have_http_status(:ok)
  end

  it 'it will render the template correctly' do
    expect(response.body).to include(' here is list of posts to a given user ')
  end

  it 'does render a  template' do
    expect(response).to render_template(:index)
  end

  describe 'show test' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'List all posts for one users status it will be ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'it will render the templat correctlye' do
      expect(response.body).to include(' here is a post to a given user')
    end

    it 'does render a template' do
      expect(response).to render_template(:show)
    end
  end
end
