class CreateUserjobs < ActiveRecord::Migration[5.2]
  def change
    create_table :userjobs do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :email
    	t.integer :telephone
    	t.text :description
    	t.string :password_diggest
    	t.string :confirmation_token
    	t.boolean :confirmed, default: false
    	t.decimal :price
      t.belongs_to :category, index: true
      
    end
  end
end
