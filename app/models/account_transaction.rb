class AccountTransaction < ApplicationRecord
    belongs_to :account
    belongs_to :user, through: :account
    belongs_to :original_transaction, class_name: "AccountTransaction", foreign_key: :reverse_to_id, optional: true, inverse_of: :reversal
    
    has_one :reversal, class_name: "AccountTransaction", foreign_key: :reverse_to_id, inverse_of: :original_transaction

    def reversal?  = reverse_to_id.present?

    def reversed?  = reversal.present?

    private

    def reversal_matches_original
        errors.add(:reverse_to_id, "cannot reverse a reversal") if original_transaction.reversal?
        errors.add(:account_id, "must match original") if account_id != original_transaction.account_id
        errors.add(:amount, "must match original") if amount != original_transaction.amount
    end
end
