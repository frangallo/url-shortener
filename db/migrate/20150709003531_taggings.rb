class Taggings < ActiveRecord::Migration
  def change
    create_table :tagtopic do |t|
      t.string :name, null: false
    end

    create_table :tagging do |t|
      t.integer :tag_id, null: false
      t.integer :url_id, null: false
    end
    add_index :tagtopic, :name
    add_index :tagging, :tag_id
    add_index :tagging, :url_id
  end
end
