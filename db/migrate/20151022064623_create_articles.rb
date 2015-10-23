class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :published, null: false
      t.references :category
      t.timestamps null: false
      t.index :title
    end
  end
end
