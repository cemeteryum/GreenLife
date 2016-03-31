class Tag < ActiveRecord::Base
  has_many :arttags, :foreign_key => "tag_id", dependent: :destroy
  has_many :arts, :through => :arttags
end
