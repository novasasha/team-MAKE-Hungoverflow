class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates_presence_of :voteable_type, :voteable_id, :user_id, :points

  validates_uniqueness_of :user_id, scope: :voteable_type
  validates_uniqueness_of :user_id, scope: :voteable_id
end
