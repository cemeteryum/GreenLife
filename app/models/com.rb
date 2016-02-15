class Com < ActiveRecord::Base
  belongs_to :user
  belongs_to :art
  validates :text, presence: true, length: {minimum: 3, maximum: 50}
end
