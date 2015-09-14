class Comment < ActiveRecord::Base
  after_commit do |comment|
    comment.article.update_comment_metadata
  end
  
  belongs_to :user
  belongs_to :article
end
