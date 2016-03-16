class Chal < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
  has_many :chaltags
  has_many :challikes, dependent: :destroy
  has_many :tags, :through => :chaltags
  has_many :hits, dependent: :destroy
  validates :cat_id, presence: { message: "must be selected" }
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :dur, presence: true
  validates :reg, presence: true, length: {minimum: 10, maximum: 3000}
  
  def thumb_up_total
    self.challikes.where(like: true).size
  end
  
  def thumb_dw_total
    self.challikes.where(like: false).size
  end
  
  def comments
    self.hits.where(p_id: 0).size
  end
end