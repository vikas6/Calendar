class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.integer :phone_no
    	t.string :gender
    	t.date :date_of_birth 
      t.timestamps null: false
    end
  end
end
