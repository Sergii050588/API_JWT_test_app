class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string  :name    ,null: false
      t.text    :body    ,null: false, default: ""
      t.integer :user_id ,null: false

      t.timestamps null: false
    end
  end
end
