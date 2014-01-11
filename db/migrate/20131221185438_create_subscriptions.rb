class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
    	t.text :parameters
    	t.text :kind
    	t.references :user, index: true

    	t.timestamps
    end
  end
end
