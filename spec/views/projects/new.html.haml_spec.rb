require 'spec_helper'

describe "projects/new.html.haml" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString",
      :organization_id => 1
    ).as_new_record)
  end

  it 'renders new project form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form', :action => projects_path, :method => 'post' do
      assert_select 'input#project_name', :name => 'project[name]'
      assert_select 'input#project_slug', :name => 'project[slug]'
      assert_select 'textarea#project_description', :name => 'project[description]'
      assert_select 'input#project_organization_id', :name => 'project[organization_id]', :type => 'hidden'
    end
  end
end
