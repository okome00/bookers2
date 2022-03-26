class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    # name 一意性バリデーション設定
    add_index :users, :name, unique: true
  end
end
