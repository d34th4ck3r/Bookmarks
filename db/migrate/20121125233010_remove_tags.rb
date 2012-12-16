class RemoveTags < ActiveRecord::Migration
  def up
	remove_column :bookmarks,:tags
  end

  def down
  end
end
