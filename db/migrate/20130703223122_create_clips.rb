class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.text :payload
      t.references :user, index: true

      t.timestamps
    end
  end
end
