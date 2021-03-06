require 'spec_helper'

describe 'projects/index.html.haml' do  
  before(:each) do
    login_user
    visit projects_path
  end
  
  it 'should not have a link to create new projects (that can be done only from an organzation page)' do
    page.should_not have_link('New Project')
  end

  describe 'when some projects exist' do
    before(:all) do
      # Create a Project
      @project = Factory(:project)
    end
    
    it 'renders a list of projects' do
      page.should have_content(@project.name)
      page.should have_content(@project.slug)
      page.should have_link(@project.organization.name, :href => organization_path(@project.organization))
      
      # Don't display the project description on this page - it's likely to be 
      # too wordy.
      page.should_not have_content(@project.description)
    end
  end
end
