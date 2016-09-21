class ChangePostToContentForPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :post, :content
  end
end
