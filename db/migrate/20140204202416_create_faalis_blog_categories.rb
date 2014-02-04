class CreateFaalisBlogCategories < ActiveRecord::Migration
  def change
    create_table :faalis_blog_categories do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
