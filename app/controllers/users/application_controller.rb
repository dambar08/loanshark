class Users::ApplicationController < ApplicationController
    before_action :authenticate_user!

    layout "users"

    private

    def user_for_paper_trail
        if current_user
            current_user.email
        else
            super
        end
    end

    def pundit_user
        current_user
    end
end
