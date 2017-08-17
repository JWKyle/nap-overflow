class Vote < ActiveRecord::Base

  validates :value, :voter_id, presence: true

  belongs_to :voter, class_name: :User
  belongs_to :voteable, polymorphic: true

end
