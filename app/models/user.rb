class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :total_karma

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    select('*').order('total_karma DESC')
  end

  def karma_sum
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(number = 1)
    number = 1 if !number
    @number = number.to_i
    self.limit(50).offset(50*(@number-1))    
  end
end
