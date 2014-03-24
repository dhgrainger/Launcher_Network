class InterestGroup < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: user_groups, source: :user
end