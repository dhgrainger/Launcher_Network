class InterestGroup < ActiveRecord::Base
  validates :group_name, presence: true
  validates :creator, presence: true

  has_many :user_groups
  has_many :users, through: :user_groups, source: :user
  has_many :posts
end
