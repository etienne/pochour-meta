class Epithet < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, length: { maximum: 30 }
  has_many :epithet_votes
end
