class EpitethVote < ActiveRecord::Base
  belongs_to :epiteth
  belongs_to :article
  belongs_to :user
end
