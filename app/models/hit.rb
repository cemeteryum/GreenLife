class Hit < ActiveRecord::Base
  belongs_to :user
  belongs_to :chal
end
