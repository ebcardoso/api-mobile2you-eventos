class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :participations, :user_id
    add_index :participations, :event_id
  end
end