class EpithetVote < ActiveRecord::Base
  belongs_to :epithet
  belongs_to :article
  belongs_to :user
  
  validates_uniqueness_of :epithet_id, scope: [:article_id, :user_id]
end
