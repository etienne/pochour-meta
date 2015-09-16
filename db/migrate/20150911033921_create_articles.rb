class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :community, index: true
      t.datetime :last_comment_at
      t.integer :comment_count
      t.string :slug
      
      t.timestamps null: false
    end
    
    add_index :articles, :slug, unique: true
  end
end
