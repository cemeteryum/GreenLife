class Arttag < ActiveRecord::Base
  belongs_to :art
  belongs_to :tag
end
