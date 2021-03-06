class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.boolean :public
      t.string :slug
      t.timestamps null: false
    end
    
    add_index :communities, :slug, unique: true
    
    create_table :communities_users, id: false do |t|
      t.belongs_to :community, index: true
      t.belongs_to :user, index: true
    end
  end
end
