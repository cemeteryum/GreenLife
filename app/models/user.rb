class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase}
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 30}
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  length: {minimum: 5, maximum: 30},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true,  length: {minimum: 5, maximum: 30}
end