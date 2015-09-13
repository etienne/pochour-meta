class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  has_many :comments, -> { order "created_at" }
end
