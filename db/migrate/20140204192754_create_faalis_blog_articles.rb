class CreateFaalisBlogArticles < ActiveRecord::Migration
  def change
    create_table :faalis_blog_articles do |t|
      t.string :title
      t.text :content
      t.boolean :publish
      t.string :meta_title
      t.text :meta_desc

      t.timestamps
    end
  end
end
