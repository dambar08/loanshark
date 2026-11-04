class Loan < ApplicationRecord
    include AASM
    belongs_to :user


    aasm column: :state do
      state :incomplete, initial: true
      state :applied
      state :approval_in_process
      state :approved
      state :agreement_signed
      state :cancelled
      state :rejected

      event :apply do
        transitions from: :incomplete, to: :applied
      end

      event :auto_reject do
        transitions from: :applied, to: :rejected
      end

      event :auto_approval_in_process do
        transitions from: :applied, to: :approval_in_process
      end

      event :sign_agreement do
        transitions from: :approved, to: :agreement_signed
      end

      event :disburse do
        transitions :agreement_signed => :disbursed
      end

      event :cancel do
        transitions from: [:imcomplete, :applied, :approval_in_process, :approved, :agreement_signed], to: :cancelled
      end
    end
end
