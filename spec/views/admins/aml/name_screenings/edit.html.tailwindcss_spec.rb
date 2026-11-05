require 'rails_helper'

RSpec.describe "admins/aml/name_screenings/edit", type: :view do
  let(:name_screening) {
    NameScreening.create!()
  }

  before(:each) do
    assign(:name_screening, name_screening)
  end

  it "renders the edit admins/aml_name_screening form" do
    render

    assert_select "form[action=?][method=?]", admins/aml_name_screening_path(name_screening), "post" do
    end
  end
end
