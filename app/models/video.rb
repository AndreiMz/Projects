# frozen_string_literal: true

# video model
class Video < ApplicationRecord
  validates :channel_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validates :youtube_id, uniqueness: true
  belongs_to :channel, optional: true

  after_initialize :make_params_from_id, if: :new_record?

  def make_params_from_id
    unless self.youtube_id.nil?
      yt_vid = Yt::Video.new id:self.youtube_id
      self.title = yt_vid.title
      self.url = 'https://www.youtube.com/watch?v=' + yt_vid.id
      self.duration = yt_vid.length
      self.is_hd = yt_vid.hd?
    end
  end
end
