class Comment < ActiveRecord::Base
  attr_accessible :description, :reply_by, :user_id ,:flag ,:comment_id,:article_id
end
