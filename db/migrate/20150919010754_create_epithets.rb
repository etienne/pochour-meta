class CreateEpithets < ActiveRecord::Migration
  def change
    create_table :epithets do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :epithet_votes do |t|
      t.belongs_to :epithet, index: true
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
