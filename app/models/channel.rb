# frozen_string_literal: true
#  create_table 'channels', force: :cascade do |t|
#    t.string 'name'
#    t.string 'channel_url'
#    t.datetime 'created_at', null: false
#    t.datetime 'updated_at', null: false
#    t.string 'youtube_id'
#  end
# channel model

class Channel < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :channel_url, presence: true
  validates :youtube_id, uniqueness: true
  has_many :videos, dependent: :destroy
  has_many :favorites, dependent: :destroy

  after_initialize :make_params_from_id, if: :new_record?

  def make_params_from_id
    unless self.youtube_id.nil?
      yt_obj = Yt::Channel.new id: self.youtube_id
      self.channel_url = 'https://www.youtube.com/' + yt_obj.title
      self.name = yt_obj.title
    end
  end

  def videos_as_yt_objs
    arr = []
    self.videos.each do |v|
      x = Yt::Video.new id: v.youtube_id
      arr << x
    end
    arr
  end
end
