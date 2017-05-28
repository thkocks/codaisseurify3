class Album < ApplicationRecord
  belongs_to :user

  validates :release_date, presence: true
  validates :genre, presence: true
  validates :title, presence: true, length: {maximum: 50}
end
