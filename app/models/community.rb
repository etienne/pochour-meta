class Community < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { order "name" }
  has_many :articles, -> { order "created_at DESC" }
end
