class DropMovieListBookmarkTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :movies
    drop_table :lists
    drop_table :bookmarks
  end
end
