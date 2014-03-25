class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :user, presence: true
  validates :post, presence: true

  belongs_to :post, counter_cache: true
  belongs_to :user
end
