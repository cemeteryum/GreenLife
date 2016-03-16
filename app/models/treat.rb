class Treat < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
  has_many :treattags
  has_many :treatlikes, dependent: :destroy
  has_many :tags, :through => :treattags
  has_many :reps, dependent: :destroy
  validates :cat_id, presence: { message: "must be selected" }
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :sym, presence: true, length: {minimum: 10, maximum: 3000}
  validates :reg, presence: true, length: {minimum: 10, maximum: 3000}
  
  def thumb_up_total
    self.treatlikes.where(like: true).size
  end
  
  def thumb_dw_total
    self.treatlikes.where(like: false).size
  end
  
  def comments
    self.reps.where(p_id: 0).size
  end
  
end
