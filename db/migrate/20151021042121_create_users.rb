class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest
      t.text :bio
      t.index :username, unique: true
      t.index :email, unique: true
      t.timestamps null: false
    end
  end
end
