class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :user_groups
  has_many :interest_groups, through: :user_groups, source: :interest_group
end
