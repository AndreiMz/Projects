# frozen_string_literal: true

# default by deviseW
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable
  has_many :favorites
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :username, with: /^(?=.{4,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/, multiline: true
  validate :validate_username
  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def validate_username
    User.where(email: username).exists? && errors.add(:username, :invalid)
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
                 where(conditions.to_hash)
                  .where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_hash).first
    end
  end
end
