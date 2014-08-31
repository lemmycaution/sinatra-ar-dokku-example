class CreateReqs < ActiveRecord::Migration
  def change
    
    create_table :reqs do |t|
      t.string      :meta
      t.timestamps
    end
  
  end
end