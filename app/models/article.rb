class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  belongs_to :community
  belongs_to :original_article, class_name:"Article"
  belongs_to :series
  has_many :comments, -> { order "created_at" }
  has_many :epithet_votes
  has_many :responses, class_name: "Article", foreign_key: "original_article_id"
  scope :recently_commented, -> { where.not(last_comment_at: nil).order("last_comment_at DESC").limit(12) }
  
  def update_comment_metadata
    update!(comment_count: comments.size, last_comment_at: comments.last.created_at)
  end
  
  def epithet_votes_grouped_by_epithet
    epithet_votes.group(:epithet_id)
  end
  
  def epithets_with_users
    # Probably needs optimization.
    epithets_with_users = {}
    epithet_votes.each do |epithet_vote|
      epithets_with_users[epithet_vote.epithet] ||= [] << epithet_vote.user
    end
    epithets_with_users
  end
  
  def epithets_sentence
    epithet_names = epithet_votes.map {|e| e.epithet.name}[0..2].to_sentence.capitalize
    epithet_names << " (#{I18n.t(:among_others)})" if epithet_votes.size > 3
    epithet_names
  end
  
  def previous_in_series
    unless series.blank?
      previous = nil
      series.articles.each do |article|
        return previous if self == article && previous.class.name == "Article"
        previous = article
      end
    end
    false
  end
  
  def next_in_series
    unless series.blank?
      return_next_article = false
      series.articles.each do |article|
        return article if return_next_article
        return_next_article = true if self == article
      end
    end
    false
  end
end
