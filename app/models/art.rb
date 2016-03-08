class Art < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
  has_many :artlikes, dependent: :destroy
  has_many :arttags
  has_many :tags, :through => :arttags
  has_many :coms, dependent: :destroy
  validates :cat_id, presence: { message: "must be selected" }
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 3000}
  
  def thumb_up_total
    self.artlikes.where(like: true).size
  end
  
  def thumb_dw_total
    self.artlikes.where(like: false).size
  end
  
end
