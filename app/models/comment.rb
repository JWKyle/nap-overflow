class Comment < ActiveRecord::Base

  validates :content, :author_id, presence: true

  belongs_to :author, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

end
