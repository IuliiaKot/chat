class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :recipient_id, index: true
      t.integer :sender_id, index: true

      t.timestamps
    end
    add_index :conversations, [:recipient_id, :sender_id], unique: true
  end
end
