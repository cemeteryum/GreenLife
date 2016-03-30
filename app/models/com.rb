class Com < ActiveRecord::Base
  belongs_to :user
  belongs_to :art
  has_many :com, foreign_key: "p_id", dependent: :destroy
  validates :text, presence: true, length: {minimum: 3, maximum: 30}
end
