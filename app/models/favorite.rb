# frozen_string_literal: true

# model is actually just linking 2 other models
class Favorite < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :channel, optional: true
  belongs_to :video, optional: true
  #validates :user_id, uniqueness: { scope: :channel_id, message: 'Cannot have same channel favorited twice', allow_nil: true, allow_blank: true}
  validate :unique_not_nil
  validate :is_dupe?
  validates_uniqueness_of :video_id, scope: :user_id

  private

  def is_dupe?
    unless self.video_id.nil?
      vid = Video.find(self.video_id)
      ch = vid.channel_id
      uids = Favorite.where(channel_id: ch).pluck('user_id')
      if uids.include?(self.user_id.to_s)
        @errors.add(:video_id, 'already exists in some form')
      end
    end
  end

  def unique_not_nil
    unless self.channel_id.nil?
      if Favorite.where(user_id: self.user_id).pluck('channel_id').include?(self.channel_id.to_s)
        @errors.add(:user_id, 'can\'t favorite same channel twice')
      end
    end
  end
end
