# frozen_string_literal: true

# video model
class Video < ApplicationRecord
  validates :channel_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validates :youtube_id, uniqueness: true
  belongs_to :channel, optional: true
end
