class Cat < ActiveRecord::Base
  has_many :arts, dependent: :destroy
end