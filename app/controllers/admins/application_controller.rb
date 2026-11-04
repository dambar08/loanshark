class Admins::ApplicationController < ApplicationController
    before_action :authenticate_admin!

    layout "admins"

    private

    def user_for_paper_trail
        if current_admin
            current_admin.email
        else
            super
        end
    end

    def pundit_user
        current_admin
    end
end
