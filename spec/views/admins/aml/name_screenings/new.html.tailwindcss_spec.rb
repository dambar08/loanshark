require 'rails_helper'

RSpec.describe "admins/aml/name_screenings/new", type: :view do
  before(:each) do
    assign(:name_screening, NameScreening.new())
  end

  it "renders new admins/aml_name_screening form" do
    render

    assert_select "form[action=?][method=?]", admins_aml_name_screenings_path, "post" do
    end
  end
end
