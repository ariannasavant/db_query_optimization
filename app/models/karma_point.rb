class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_save :update_total_karma


  def update_total_karma
    self.user.update_attribute(:total_karma, user.total_karma+self.value)
  end
end
