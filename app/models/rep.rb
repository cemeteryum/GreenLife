class Rep < ActiveRecord::Base
  belongs_to :user
  belongs_to :treat
  has_many :rep, foreign_key: "p_id", dependent: :destroy
  validates :text, presence: true, length: {minimum: 3, maximum: 50}
end
