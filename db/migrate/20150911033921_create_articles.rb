class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      
      t.timestamps null: false
    end
    
    create_table :articles_communities, id: false do |t|
      t.belongs_to :article, index: true
      t.belongs_to :community, index: true
    end
  end
end
