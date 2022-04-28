require 'rails_helper'

RSpec.describe 'Users controllers', type: :request do
  before :each do
    get '/users/'
  end

  it 'List all users status it will be ok' do
    expect(response).to have_http_status(:ok)
  end

  it 'it will render the template correctly' do
    expect(response.body).to include(' here is list of users ')
  end

  it 'does render a  template' do
    expect(response).to render_template(:index)
  end

  describe 'show test' do
    before :each do
      get '/users/:id'
    end

    it 'List one user  status it will be ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'it will render the templat correctlye' do
      expect(response.body).to include(' here is a user')
    end

    it 'does render a template' do
      expect(response).to render_template(:show)
    end
  end
end
