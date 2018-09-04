# frozen_string_literal: true

# model is actually just linking 2 other models
class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :channel, optional: true
  validates :user_id, uniqueness: { scope: :channel_id, message: 'Cannot have same channel favorited twice' }
end
