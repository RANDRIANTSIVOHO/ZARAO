class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
    	t.string :title
    	t.text :description
    	t.decimal :price
    	t.integer :delais
      
    end
  end
end
