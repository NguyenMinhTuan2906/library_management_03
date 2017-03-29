class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :paperback
      t.string :image
      t.boolean :status, default: true
      t.integer :publisher_id
      t.integer :category_id

      t.timestamps
    end
  end
end
