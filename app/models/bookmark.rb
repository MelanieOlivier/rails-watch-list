class Bookmark < ApplicationRecord
  # Associations
  belongs_to :movie
  belongs_to :list

  # Validation
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
end
