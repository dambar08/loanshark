class CreateAccountTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :account_transactions do |t|
      t.belongs_to :account, foreign_key: true, null: false
      t.belongs_to :reverse_to,  foreign_key: { to_table: :account_transactions }, null: true, index: true
      t.string :transaction_type
      t.string :idempotency_key
      t.belongs_to :reference, polymorphic: true
      t.string :direction, null: false
      t.datetime :posted_at
      t.decimal :amount, precision: 9, scale: 2
      t.timestamps
    end

    add_index :account_transactions, :idempotency_key, unique: true
  end
end
