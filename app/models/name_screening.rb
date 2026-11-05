class NameScreening < ApplicationRecord
    belongs_to :user
    has_many :name_screening_records

  # alias_attribute :records, :name_screening_records
end
