class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :community, index: true
      t.datetime :last_comment_at
      t.integer :comment_count
      
      t.timestamps null: false
    end
  end
end
