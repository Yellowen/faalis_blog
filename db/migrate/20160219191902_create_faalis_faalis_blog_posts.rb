class CreateFaalisFaalisBlogPosts < ActiveRecord::Migration
  def change
    create_table :faalis_faalis_blog_posts do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.integer :user_id
      t.integer :views
      t.integer :likes
      t.integer :dislikes
      t.boolean :allow_comments
      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end
  end
end
