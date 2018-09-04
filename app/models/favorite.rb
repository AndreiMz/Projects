# frozen_string_literal: true

# model is actually just linking 2 other models
class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :channel, optional: true
  validates :id_user, uniqueness: { scope: :id_channel, message: 'Cannot have same channel favorited twice' }
end
