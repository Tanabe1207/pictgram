class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :contents

      t.timestamps
    end
  end
end
