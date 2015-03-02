class AddReplyByFieldToComment < ActiveRecord::Migration
  def change
    add_column :comments , :reply_by ,:string
  end
end
