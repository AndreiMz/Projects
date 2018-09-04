# frozen_string_literal: true

# channel model
class Channel < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :channel_url, presence: true
  validates :youtube_id, uniqueness: true
  has_many :videos, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
