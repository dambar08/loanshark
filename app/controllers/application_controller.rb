require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  include Pundit::Authorization
  include Pagy::Method
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  skip_before_action :verify_authenticity_token
  before_action :set_paper_trail_whodunnit

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
