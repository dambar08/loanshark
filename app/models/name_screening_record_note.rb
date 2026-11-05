class NameScreeningRecordNote < ApplicationRecord
    belongs_to :name_screening_record
    has_one :user, through: :name_screening_record
end
