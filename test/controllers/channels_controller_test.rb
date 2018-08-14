require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  ch = { name: 'TheFatRat',
         channel_url: 'https://www.youtube.com/user/ThisIsTheFatRat',
         youtube_id: 'UCa_UMppcMsHIzb5LDx1u9zQ' }

  def setup
    @password = 'password'
    @user = User.create(email: "#{rand(500)}@example.com",
                        password: @password)
  end

  test 'new' do
  end

  test 'create when not signed in' do
    post channels_path, params: ch
    assert_redirected_to new_user_session_path
  end

  test 'create when signed in' do
    sign_in(user: @user, password: @password)
    post channels_path, params: { channel: ch }
    assert_redirected_to channels_path(Channel.last)
  end

  test 'index' do
    get channels_path
    assert_response :success
  end

  test 'show' do
  end
end
