class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
    	t.string :email
    	t.string :password_digest
    	t.boolean :admin, default: true
      	t.boolean :confirmed, default: true
    end
  end
end
