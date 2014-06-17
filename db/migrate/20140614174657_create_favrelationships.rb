class CreateFavrelationships < ActiveRecord::Migration
  def change
    create_table :favrelationships do |t|
      t.integer :favmp_id
      t.integer :favby_id

      t.timestamps
    end
    add_index :favrelationships, :favmp_id
    add_index :favrelationships, :favby_id
    add_index :favrelationships, [:favmp_id, :favby_id], unique: true
  end
end
