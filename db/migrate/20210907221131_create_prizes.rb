class CreatePrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :prizes do |t|
      t.string :name
      t.integer :participation_id

      t.timestamps
    end
    add_index :prizes, :participation_id
  end
end
