class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :access_token, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
