class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name,               null: false
      t.string :surname,            null: false
      t.string :email,              null: false
      t.string :password_digest,    null: false
      t.string :role,               null: false
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    
      t.timestamps
    end
  end
end
