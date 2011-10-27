require 'spec_helper'

describe "projects/edit.html.haml" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString",
      :organization_id => 1
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_slug", :name => "project[slug]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_organization_id", :name => "project[organization_id]"
    end
  end
end
