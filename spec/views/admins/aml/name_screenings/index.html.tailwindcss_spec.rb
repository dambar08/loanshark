require 'rails_helper'

RSpec.describe "admins/aml/name_screenings/index", type: :view do
  before(:each) do
    assign(:name_screenings, [
      NameScreening.create!(),
      NameScreening.create!()
    ])
  end

  it "renders a list of admins/aml/name_screenings" do
    render
    cell_selector = 'div>p'
  end
end
