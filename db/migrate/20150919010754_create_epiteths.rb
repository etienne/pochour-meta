class CreateEpiteths < ActiveRecord::Migration
  def change
    create_table :epiteths do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :epiteth_votes do |t|
      t.belongs_to :epiteth, index: true
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
