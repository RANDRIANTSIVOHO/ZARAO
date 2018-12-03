class CreateInteresteds < ActiveRecord::Migration[5.2]
  def change
    create_table :interesteds do |t|
    	t.belongs_to :userjob, index: true
    	t.belongs_to :offer, index: true
     
    end
  end
end
