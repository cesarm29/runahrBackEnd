class CreateInputandoutputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inputandoutputs do |t|
      t.datetime :date
      t.string :observation
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
