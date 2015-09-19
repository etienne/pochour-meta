class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  belongs_to :community
  has_many :comments, -> { order "created_at" }
  has_many :epiteth_votes
  scope :recently_commented, -> { where.not(last_comment_at: nil).order("last_comment_at DESC").limit(12) }
  
  def update_comment_metadata
    update!(comment_count: comments.size, last_comment_at: comments.last.created_at)
  end
  
  def epiteths_with_counts
    # Probably needs optimization.
    epiteth_votes.group(:epiteth_id).count.map do |epiteth_array|
      [Epiteth.find(epiteth_array.first), epiteth_array.second]
    end
  end
end
