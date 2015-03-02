class RenameTypeInComment < ActiveRecord::Migration
  def change
    rename_column :comments ,:type ,:flag
  end
end
