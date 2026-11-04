class NameScreeningRecordNote < ApplicationRecord
    belongs_to :name_screening_record
    belongs_to :user, through: :name_screening_record
end
