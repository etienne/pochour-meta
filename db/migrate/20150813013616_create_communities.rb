class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.boolean :public
      t.timestamps null: false
    end
    
    create_table :communities_users, id: false do |t|
      t.belongs_to :communities, index: true
      t.belongs_to :users, index: true
    end
  end
end
