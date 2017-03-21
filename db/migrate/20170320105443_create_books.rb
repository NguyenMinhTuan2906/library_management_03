class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :paperback
      t.string :image
      t.boolean :status
      t.integer :authors_id
      t.integer :publishers_id
      t.integer :categories_id

      t.timestamps
    end
  end
end
