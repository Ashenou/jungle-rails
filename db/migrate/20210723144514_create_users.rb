class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.text :lastName
      t.text :email
      t.text :password_digest
      t.timestamps null: false
    end
  end
end
