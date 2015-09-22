class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  belongs_to :community
  has_many :comments, -> { order "created_at" }
  has_many :epithet_votes, -> { group :epithet_id }
  scope :recently_commented, -> { where.not(last_comment_at: nil).order("last_comment_at DESC").limit(12) }
  
  def update_comment_metadata
    update!(comment_count: comments.size, last_comment_at: comments.last.created_at)
  end
  
  def epithets_with_counts
    # Probably needs optimization.
    epithet_votes.count.map do |epithet_array|
      { epithet: Epithet.find(epithet_array.first), count: epithet_array.second}
    end
  end
  
  def epithets_sentence
    epithet_names = epithet_votes.map {|e| e.epithet.name}[0..2].to_sentence.capitalize
    epithet_names << " (#{I18n.t(:among_others)})" if epithet_votes.size > 3
  end
end
