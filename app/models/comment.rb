class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  validates_presence_of :body, :user_id, :commentable_type, :commentable_id
end
