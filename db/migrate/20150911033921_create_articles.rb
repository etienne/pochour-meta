class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :community, index: true, foreign_key: true
      t.references :series, index: true, foreign_key: true
      t.integer :original_article_id
      t.datetime :last_comment_at
      t.integer :comment_count
      t.string :slug
      
      t.timestamps null: false
    end
    
    add_index :articles, :slug, unique: true
    add_index :articles, :original_article_id
  end
end
