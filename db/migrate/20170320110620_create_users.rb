class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone_number
      t.boolean :is_admin, default: 1

      t.timestamps
    end
  end
end
