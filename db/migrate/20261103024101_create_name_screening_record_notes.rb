class CreateNameScreeningRecordNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :name_screening_record_notes do |t|
      t.belongs_to :name_screening_record, foreign_key: true
      t.text :note
      t.timestamps
    end
  end
end
