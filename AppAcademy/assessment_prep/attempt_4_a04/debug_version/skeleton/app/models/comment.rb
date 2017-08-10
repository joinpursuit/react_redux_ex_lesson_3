class Comment < ActiveRecord::Base
  validate :body, :link, :user, presence: true

  belongs_to :user
  has_one :link
end
