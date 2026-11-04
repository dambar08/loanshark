class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :account_type
      t.decimal :balance, precision: 9, scale: 2, default: "0.0"
      t.timestamps
    end

    add_index :accounts, :account_type
    add_index :accounts, [ :user_id, :account_type ], unique: true
  end
end
