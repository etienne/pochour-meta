class EpitethVote < ActiveRecord::Base
  belongs_to :epiteth
  belongs_to :article
  belongs_to :user
  
  validates_uniqueness_of :epiteth_id, scope: [:article_id, :user_id]
end
