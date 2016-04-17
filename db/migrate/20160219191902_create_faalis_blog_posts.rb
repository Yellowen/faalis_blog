class CreateFaalisBlogPosts < ActiveRecord::Migration
  def change
    create_table :faalis_blog_posts do |t|
      t.string :title
      t.string :permalink
      t.text   :raw_content
      t.text   :content
      t.integer :category_id, null: false
      t.boolean :published
      t.integer :user_id,  null: false
      t.integer :views,    default: 0
      t.integer :likes,    default: 0
      t.integer :dislikes, default: 0
      t.boolean :allow_comments, default: true
      t.boolean :members_only, default: false

      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end

    add_index :faalis_blog_posts, :category_id
    domain_aware :faalis_blog_posts
  end
end
