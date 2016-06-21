class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.references :event
    	t.references :user
      t.timestamps null: false
    end
  end
end
