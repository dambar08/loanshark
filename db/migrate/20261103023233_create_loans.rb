class CreateLoans < ActiveRecord::Migration[8.1]
  def change
    create_table :loans do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.string :state, null: false
      t.decimal :amount, precision: 9, scale: 2, default: 0.0
      t.integer :tenor, null: false
      t.string :application_id, null: false
      t.timestamps
    end

    add_index :loans, :application_id, unique: true
  end
end
