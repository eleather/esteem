require 'spec_helper'

describe "projects/show.html.haml" do
  before(:all) do
    # Create a Project
    @project = Factory(:project)
    
    visit project_path(@project)
  end
  
  it 'should render the correct record attributes' do
    page.should have_content(@project.name)
    page.should have_content(@project.slug)
    page.should have_content(@project.description)
    page.should have_link(@project.organization.name, :href => organization_path(@project.organization))
  end
end
