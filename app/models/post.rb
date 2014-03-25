class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :user, presence: true
  validates :interest_group, presence: true

  belongs_to :user
  belongs_to :interest_group
  has_many :comments
end
