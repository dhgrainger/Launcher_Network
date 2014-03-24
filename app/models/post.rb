class Post < ActiveRecord::Base
  validates :author, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
  validates :interest_group_id, presence: true

  belongs_to :user
  belongs_to :interest_group
  has_many :comments
end
