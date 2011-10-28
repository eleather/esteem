require 'spec_helper'

describe "projects/show.html.haml" do
  before(:all) do
    # Create a Project
    @project = Factory(:project)
    
    visit project_path(@project)
  end
  
  
  ### Correctly Display Project Attributes ###
  
  it 'should render the correct record attributes' do
    page.should have_content(@project.name)
    page.should have_content(@project.slug)
    page.should have_content(@project.description)
    page.should have_link(@project.organization.name, :href => organization_path(@project.organization))
  end
  
  
  ### Dashboard Aspects ###
  
  it 'should display recent question responses aggregated by radial'
  it 'should display the 8 most recent suggestions for this project'
  
  describe 'when the user has recently answered no questions for this project' do
    it 'should display all questions for the user to answer'
  end
  
  describe 'when the user has recently answered only some questions for this project' do
    it 'should display only unanswered questions for the user to answer'
  end
  
  describe 'when the user has recently answered all questions for this project' do
    it 'should display text telling the user that they\'ve answered all the questions for now'
  end
  
  
  ### Links to Other Views ###
  
  it 'should have a link to a view showing the trends of question responses aggregated by radial over time'
end
