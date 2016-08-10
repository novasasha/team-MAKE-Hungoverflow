class Question < ActiveRecord::Base

  belongs_to :author, class_name: :User
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates_presence_of :title, :body, :author_id
end
