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
  
  describe 'in #radials section'
    it 'should display recent question responses aggregated by radial'
    it 'should have a link to a page giving more information about the radials for this project'
    it 'should have a link to a view showing the trends of question responses aggregated by radial over time'
  end
  
  describe 'in #suggestions section'
    describe 'when this project has no suggestions'
      it 'should display the new suggestion box at the top of the section'
      it 'should have no other content'
    end
    
    describe 'when this project has less than 8 suggestions'
      it 'should display the new suggestion box at the top of the section'
      it 'should display all suggestions for this project, in most-voted order'
    end

    describe 'when this project has more than 8 suggestions'
      it 'should display the new suggestion box at the top of the section'
      it 'should display the 8 most recent suggestions for this project, in most-voted order'
    end
  end
  
  describe 'in #questions section'
    describe 'when this project has no questions' do
      it 'should display text telling the user that there are no questions for this project'
    end
  
    describe 'when the user has recently answered no questions for this project' do
      it 'should display all questions for the user to answer'
    end
  
    describe 'when the user has recently answered only some questions for this project' do
      it 'should display only unanswered questions for the user to answer'
    end
  
    describe 'when the user has recently answered all questions for this project' do
      it 'should display text telling the user that they\'ve answered all the questions for now'
    end
  end
end
