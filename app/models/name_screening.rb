class NameScreening < ApplicationRecord
    belongs_to :user
    has_many :name_screening_records
end
