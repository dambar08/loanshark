class Admins::AccountTransactionsController < Admins::ApplicationController
    def index
        authorize :account
        @account = policy_scope(Account).find(params[:account_id])
    end
end
