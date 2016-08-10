require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :questions, foreign_key: :author_id
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validate :validate_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  private
  def validate_password
    if @raw_password.length == 0
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be longer than 6 characters")
    end
  end
end




