class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  belongs_to :community
  has_many :comments, -> { order "created_at" }
  has_many :epiteth_votes, -> { group :epiteth_id }
  scope :recently_commented, -> { where.not(last_comment_at: nil).order("last_comment_at DESC").limit(12) }
  
  def update_comment_metadata
    update!(comment_count: comments.size, last_comment_at: comments.last.created_at)
  end
  
  def epiteths_with_counts
    # Probably needs optimization.
    epiteth_votes.count.map do |epiteth_array|
      { epiteth: Epiteth.find(epiteth_array.first), count: epiteth_array.second}
    end
  end
  
  def epiteths_sentence
    epiteth_names = epiteth_votes.map {|e| e.epiteth.name}
    if epiteth_names.size > 4
      sentence_fragments = epiteth_names[0..2] << I18n.t(:other_epiteths, count: epiteth_names.size - 3)
    else
      sentence_fragments = epiteth_names
    end
    sentence_fragments.to_sentence.capitalize
  end
end
