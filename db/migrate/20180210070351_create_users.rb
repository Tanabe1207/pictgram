class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string:name
      t.string:email
#string is 型. name and email is column.
#reke db:migrateコマンドを使用すると、テーブルが生成される。
#変更したい場合は、reke db:rollback　後、再読み込み。

      t.timestamps
    end
  end
end
