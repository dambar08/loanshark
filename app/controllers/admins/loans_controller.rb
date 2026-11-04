class Admins::LoansController < Admins::ApplicationController
    def index
        @pagy, @loans  = pagy(policy_scope(Loan))
    end

    def show
    end

    def destroy
    end

    def cancel
        authorize :loan
        @loan = policy_scope(Loan).find(params[:id])
    end

    def approve
    end
end
