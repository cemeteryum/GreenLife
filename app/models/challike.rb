class Challike < ActiveRecord::Base
  belongs_to :user
  belongs_to :chal
  validates :user_id, presence: { message: "You must be logged in!" }
  validates_uniqueness_of :user, scope: :chal
end