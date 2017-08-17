class User < ActiveRecord::Base

  validates: :username, :email, :password_hash, presence: true
  validates: :username, :email, uniqueness: true

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :author_id

end
