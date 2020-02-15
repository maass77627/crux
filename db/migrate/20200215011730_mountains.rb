class Mountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name 
      t.string :content
      t.integer :user_id 
    end 
      
  end
end
