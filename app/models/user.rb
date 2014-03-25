class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true
  validates :launcher_or_ee, presence: true, inclusion: { in: ['launcher', 'ee'] }

  has_many :created_groups, foreign_key: 'creator_id', class_name: 'InterestGroup'
  has_many :posts
  has_many :comments
  has_many :user_groups
  has_many :interest_groups, through: :user_groups, source: :interest_group

  def name_of_groups
    interest_groups.map { |g| g.group_name }
    #interest_groups.pluck(:group_name)
  end

  def count_posts
    posts.count
  end

  def count_comments
    comments.count
  end
end
