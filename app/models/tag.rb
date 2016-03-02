class Tag < ActiveRecord::Base
  has_many :arttags
  has_many :arts, :through => :arttags
end
