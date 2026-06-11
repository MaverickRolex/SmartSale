class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone
      t.text :address
      t.integer :role, null: false, default: 1
      t.string :encrypted_password, null: false, default: ""
      t.string :remember_token
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
    add_index :users, :remember_token, unique: true
  end
end
