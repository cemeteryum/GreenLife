class Hit < ActiveRecord::Base
  belongs_to :user
  belongs_to :chal
  has_many :hit, foreign_key: "p_id", dependent: :destroy
  validates :text, presence: true, length: {minimum: 3, maximum: 50}
end
