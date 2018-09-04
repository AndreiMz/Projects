require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    @usr = create(:user)
    @ch = create(:channel)
  end

  context 'when logged in' do
    before(:each) do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'get index' do
      it 'creates index view properly' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'post create' do
      xit 'adds a new favorite to current_user'
      post :create_favorite, params: { id_user: User.first.id, id_channel: Channel.first.youtube_id }
      expect(Favorite.count).to eq(1)
    end
  end
end
