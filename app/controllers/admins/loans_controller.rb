class Admins::LoansController < Admins::ApplicationController
    before_action :set_loan, only: %i[ show edit update destroy cancel approve ]

    def index
        @pagy, @loans  = pagy(policy_scope(Loan))
    end

    def show
    end

    def destroy
    end

    def edit
    end

    def update
    end

    def cancel
        authorize :loan
        @loan = policy_scope(Loan).find(params[:id])
    end

    def approve
    end

    private
    def set_loan
        @loan = Loan.find_by(id: params[:id])
    end
end
