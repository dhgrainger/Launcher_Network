class InterestGroup < ActiveRecord::Base
  validates :group_name, presence: true
  validates :creator, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :user_groups
  has_many :users, through: :user_groups, source: :user
  has_many :posts

  def numberofposts
    posts.count
  end

  def favorite
    posts.order("comments_count DESC").limit(3).take
  end

end
