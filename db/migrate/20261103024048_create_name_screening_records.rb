class CreateNameScreeningRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :name_screening_records do |t|
      t.belongs_to :name_screening, foreign_key: true
      t.belongs_to :loan, foreign_key: true, optional: true
      t.string :risk_level
      t.string :sanction_status
      t.string :pep_status
      t.string :adverse_media_status
      t.string :law_enforcement_status
      t.string :alert_identifier
      t.datetime :screened_at
      t.timestamps
    end
  end
end
