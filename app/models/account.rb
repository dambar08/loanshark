class Account < ApplicationRecord
    belongs_to :user

    has_many :transactions, class_name: "AccountTransaction"
    has_many :reverse_transactions, through: :transactions
end
