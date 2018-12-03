class CreateUserservices < ActiveRecord::Migration[5.2]
  def change
    create_table :userservices do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :email
    	t.integer :telephone
    	t.string :password_diggest
    	t.string :confirmation_token
    	t.boolean :confirmed, default: false
      
    end
  end
end
