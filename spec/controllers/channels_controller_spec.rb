require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  before(:all) do
    #don't do this

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    #don't do that ^

    @ch = create(:channel)
  end

  context 'when logged in' do
    before(:each) do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'GET #index' do
      it 'renders index properly' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns to @channels' do
        get :index
        expect(assigns(:channels)).to eq(Channel.all)
      end
    end

    describe 'post create' do
      it 'creates channel when params are good' do
        get :new
        expect(response).to render_template('new')
        post :create, params: { channel: { name: 'test', youtube_id: 'test123', channel_url: 'www.test.com' }, videos: nil }
        expect(response).to redirect_to(channel_path(Channel.last))
        expect(Channel.count).to eq(2)
      end

      it 'rerenders new when params are bad' do
        get :new
        expect(response).to render_template('new')
        post :create, params: { channel: {
                                          name: nil,
                                          youtube_id: nil
                                         },
                                videos: nil }
        expect(response).to render_template('new')
      end
    end

    describe 'patch update' do
      it 'assigns new fields when params are good' do
        post :update, params: { id: Channel.first, channel: { name: 'Kolketiv' } }
        expect(Channel.first.name).to eq('Kolketiv')
      end

      it 'renders edit page again when params are bad' do
        post :update, params: { id: Channel.first, channel: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end

    describe 'destroy' do
      it 'eliminates record from db' do
        delete :destroy, params: { id: Channel.first.id }
        expect(Channel.count).to eq(0)
      end
    end
  end

  context 'when not logged in' do
    describe 'post create' do
      it 'redirects to login when click on new' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'patch update' do
      it 'redirect to login instead of getting' do
        post :create, params: { channel: { name: 'a', channel_url: 'b', youtube_id: 'c' }, videos: nil }
        expect(response).to redirect_to new_user_session_path
        expect(Channel.count).to eq(1)
      end
    end

    describe 'get index' do
      it 'renders index properly' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'destroy' do
      it 'redirects to login' do
        delete :destroy, params: { id: Video.first.id }
         #DO NOT HARDCODE ANYTHING !!!! 

        expect(response).to redirect_to channels_path
      end
    end
  end
end
