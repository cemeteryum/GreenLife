class Artlike < ActiveRecord::Base
  belongs_to :user
  belongs_to :art
  
  validates_uniqueness_of :user, scope: :art
end