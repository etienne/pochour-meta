class Series < ActiveRecord::Base
  belongs_to :user
  has_many :articles, -> { order "created_at" }
end
