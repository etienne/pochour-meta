class Community < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_and_belongs_to_many :users, -> { order "name" }
  has_many :articles, -> { order "created_at DESC" }
end
