class UserGroup < ActiveRecord::Base
  validates :user_id, presence: true
  validates :interest_group_id, presence: true

  belongs_to :user
  belongs_to :interest_group
end
