require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe 'GET /index' do\
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns all existing boards' do
      get :index
      expect(response.body).not_to be_empty
    end
  end
end
