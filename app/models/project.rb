class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :user_id, :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
