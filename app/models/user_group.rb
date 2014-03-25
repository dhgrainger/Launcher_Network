class UserGroup < ActiveRecord::Base
  validates :user, presence: true
  validates :interest_group, presence: true

  belongs_to :user
  belongs_to :interest_group
end
