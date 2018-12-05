class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.belongs_to :userjob, index: true, optional: true
    	t.belongs_to :userservice, index: true, optional: true
    	t.text :description
      
    end
  end
end
