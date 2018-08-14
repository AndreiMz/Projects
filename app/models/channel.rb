# frozen_string_literal: true

# channel model
class Channel < ApplicationRecord
  validates :name, presence: true
  validates :channel_url, presence: true
  has_many :videos, dependent: :destroy
end
