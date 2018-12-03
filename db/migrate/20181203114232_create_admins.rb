class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
    	t.string :email
    	t.string :password_diggest
    	t.boolean :admin, default: true
      
    end
  end
end
