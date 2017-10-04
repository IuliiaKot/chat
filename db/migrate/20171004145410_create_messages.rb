class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :conversation
      t.references :user

      t.timestamps
    end
  end
end
