class Art < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
  has_many :coms, dependent: :destroy
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 3000}
end
