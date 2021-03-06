require 'spec_helper'

describe "organizations/edit.html.haml" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organizations_path(@organization), :method => "post" do
      assert_select "input#organization_name", :name => "organization[name]"
      assert_select "input#organization_slug", :name => "organization[slug]"
      assert_select "textarea#organization_description", :name => "organization[description]"
    end
  end
end
