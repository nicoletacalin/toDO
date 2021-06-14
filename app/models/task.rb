class Task < ApplicationRecord
  belongs_to :user

  validates :title, :details, presence: true

  scope :completed, -> {
    where(:completed => true)
  }

  scope :todo, -> {
    where(:completed => false)
  }
end
