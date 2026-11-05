require 'rails_helper'

RSpec.describe "admins/aml/name_screenings/show", type: :view do
  before(:each) do
    assign(:name_screening, NameScreening.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
