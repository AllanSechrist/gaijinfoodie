class AddLikesToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :likes, :integer, default: 0, null: false
  end
end
