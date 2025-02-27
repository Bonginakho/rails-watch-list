class Movie < ApplicationRecord
  has_many :bookmarks
  validate :cannot_delete_if_bookmarked

  validates :overview, :title, presence: true
  validates :title, uniqueness: true

  private
  def cannot_delete_if_bookmarked
    if bookmarks.any?
      errors.add(:base, 'Cannot delete movie if it is referenced in at least one bookmark.')
    end
  end
end
