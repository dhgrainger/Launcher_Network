class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true
  validates :launcher_or_ee, presence: true

  has_many :posts
  has_many :comments
  has_many :user_groups
  has_many :interest_groups, through: :user_groups, source: :interest_group


end
