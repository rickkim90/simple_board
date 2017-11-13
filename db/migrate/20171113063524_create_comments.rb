class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id #자기에 속한 id
      t.string :content

      t.timestamps null: false
    end
  end
end
