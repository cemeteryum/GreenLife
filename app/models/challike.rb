class Challike < ActiveRecord::Base
  belongs_to :user
  belongs_to :chal
  
  validates_uniqueness_of :user, scope: :chal
end