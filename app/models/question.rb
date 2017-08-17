class Question < ActiveRecord::Base
  belongs_to :author
  has_many :answers
  has_one :best_answer, foreign_key: :best_answer

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :explanation, presence: true
  validates :author_id, presence: true
  #validates best_answer_id?
end
