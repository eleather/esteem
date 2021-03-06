require 'spec_helper'

describe "organizations/index.html.haml" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "Name",
        :slug => "Slug",
        :description => "Description"
      ),
      stub_model(Organization,
        :name => "Name",
        :slug => "Slug",
        :description => "Description"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
