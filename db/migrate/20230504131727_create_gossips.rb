class CreateGossips < ActiveRecord::Migration[7.0]
  def change
    create_table :gossips do |t|
      t.string :title 
      t.text :content 
      t.references :user 

      t.timestamps
    end
  end
end
