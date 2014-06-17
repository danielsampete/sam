class DropRelationshipfavs < ActiveRecord::Migration
  def up
  	drop_table :relationshipfavs
  end

  def down
  	 create_table :relationshipfavs do |t|
      t.integer :micropost_id
      t.integer :fav_by_id

      t.timestamps
    end
    add_index :relationshipfavs, :micropost_id
    add_index :relationshipfavs, :fav_by_id
    add_index :relationshipfavs, [:micropost_id, :fav_by_id], unique: true
  end
end
