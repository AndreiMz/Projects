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
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*S/, multiline: true
  validate :validate_username
  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).
      where(['lower(username) = :value OR lower(email) = :value',{ value: login.downcase}]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
