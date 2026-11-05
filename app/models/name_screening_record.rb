class NameScreeningRecord < ApplicationRecord
    NS_STATUSES = [ "CLEARED", "PENDING_REVIEW", "MATCHED" ]
    RISK_LEVELS =[ "HIGH", "MEDIUM", "LOW" ]
    belongs_to :name_screening
    belongs_to :loan, optional: true
    has_one :user, through: :name_screening

    has_many :name_screening_record_notes

    validates :risk_level, inclusion: RISK_LEVELS
    validates :pep_status, inclusion: NS_STATUSES
    validates :sanction_status, inclusion: NS_STATUSES
    validates :adverse_media_status, inclusion: NS_STATUSES
    validates :law_enforcement_status, inclusion: NS_STATUSES
end
