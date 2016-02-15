class Treattag < ActiveRecord::Base
  belongs_to :treat
  belongs_to :tag
end
