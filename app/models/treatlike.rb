class Treatlike < ActiveRecord::Base
  belongs_to :user
  belongs_to :treat
  validates :user_id, presence: { message: "You must be logged in!" }
  validates_uniqueness_of :user, scope: :treat
end