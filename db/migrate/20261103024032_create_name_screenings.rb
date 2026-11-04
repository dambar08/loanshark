class CreateNameScreenings < ActiveRecord::Migration[8.1]
  def change
    create_table :name_screenings do |t|
      t.belongs_to :user, foreign_key: true
      t.jsonb :result
      t.timestamps
    end
  end
end
