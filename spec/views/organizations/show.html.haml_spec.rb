require 'spec_helper'

describe "organizations/show.html.haml" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "Name",
      :slug => "Slug",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
