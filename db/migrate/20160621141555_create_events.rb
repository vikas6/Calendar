class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.references :user
    	t.string :title
    	t.datetime :from_time
    	t.datetime :until_time
    	t.string :description
      t.timestamps null: false
    end
  end
end
