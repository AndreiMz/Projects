require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do

before(:all) do
   @pars = { channel: {  
                       name: 'Dubioza', 
                       channel_url: 'UCSlEdyj6I4TX8mcGwL8rVlw',
                       youtube_id: 'UCSlEdyj6I4TX8mcGwL8rVlw'
                       }, videos: nil }
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
        post :create, params: @pars
        expect(response).to redirect_to(channel_path(Channel.last))
        expect(Channel.count).to eq(1)
      end

      it 'rerenders new when params are bad' do 
        get :new
        expect(response).to render_template('new')
        post :create, params:{ channel:{
                                          name: nil, 
                                          youtube_id: nil
                                        }, 
                                        videos: nil }
        expect(response).to render_template('new')
      end
    end

    describe 'patch update' do 

      it 'assigns new fields when params are good' do
        post :create, params: @pars 
        expect(Channel.first.name).to eq('Dubioza')
        post :update, params:{ id: Channel.first, channel: { name: 'Kolketiv' } }
        expect(Channel.first.name).to eq('Kolketiv')
      end

      it 'renders edit page again when params are bad' do 
        post :create, params: @pars
        post :update, params:{ id: Channel.first, channel:{ name: nil } }
        expect(response).to render_template(:edit)
      end
    end

    describe 'destroy' do
      
      it 'eliminates record from db' do
        post :create, params: @pars
        expect(Channel.count).to eq(1)
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
        post :create, params: @pars
        expect(response).to redirect_to new_user_session_path
        expect(Channel.count).to eq(0)
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
        chann = double(Channel.new)
        allow(Channel).to receive(:find).with(an_instance_of(String)).and_return(chann)
        allow(chann).to receive(:destroy)
        delete :destroy, params: {id:1}
        expect(response).to redirect_to channels_path
      end
    end
  end
end
