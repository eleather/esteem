require 'spec_helper'

describe "organizations/show.html.haml" do
  before(:all) do
    # Create an Organization
    @organization = Factory(:organization_with_projects)
  end
  
  before(:each) do
    visit organization_path(@organization)
  end
  
  it 'should render the correct record attributes' do
    page.should have_content(@organization.name)
    page.should have_content(@organization.slug)
    page.should have_content(@organization.description)
  end
  
  it 'should render a list of projects that are part of this organization' do
    @organization.projects.each do |project|
      page.should have_link(project.name, :href => project_path(project))
    end
  end
end