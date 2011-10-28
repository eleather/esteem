require 'spec_helper'

describe "radials/edit.html.haml" do
  before(:each) do
    @radial = assign(:radial, stub_model(Radial,
      :name => "MyString",
      :description => "MyText",
      :project_id => 1
    ))
  end

  it "renders the edit radial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => radials_path(@radial), :method => "post" do
      assert_select "input#radial_name", :name => "radial[name]"
      assert_select "textarea#radial_description", :name => "radial[description]"
      assert_select "input#radial_project_id", :name => "radial[project_id]"
    end
  end
end
