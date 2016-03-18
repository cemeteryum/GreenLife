class Treatlike < ActiveRecord::Base
  belongs_to :user
  belongs_to :treat
  
  validates_uniqueness_of :user, scope: :treat
end