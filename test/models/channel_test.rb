require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  params = {
  		name: "testare", 
  		channel_url:"www.youtube.com/canal"
  	}

  test "create" do
  	canal = Channel.create!(params)
  	assert(canal.id)
  end

  test "delete" do 
  	canal = Channel.create!(params)
  	assert(Channel.delete(Channel.find_by_id(canal.id)))
  	assert_nil(Channel.find_by_id(canal.id))
  end

end
