class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  has_many :comments, -> { order "created_at" }
  scope :recently_commented, -> { order("last_comment_at DESC").limit(12) }
  
  def update_comment_metadata
    update!(comment_count: comments.size, last_comment_at: comments.last.created_at)
  end
end
