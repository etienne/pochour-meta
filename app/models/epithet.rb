class Epithet < ActiveRecord::Base
  validates :name, length: { maximum: 30 }
  has_many :epithet_votes
end
