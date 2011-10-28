require 'spec_helper'

describe 'projects/radials.html.haml' do  
  let :project do
    Factory(:project)
  end

  describe 'when project has no radials' do
    before(:each) do
      visit radials_project_path(project)
    end
    
    it 'should display text letting the user know that no radials have been configured' do
      page.should have_content('This project has no radials configured.')
    end
    
    it 'should link to a help page with more information about radials' do
      page.should have_link('this help page', :href => radials_help_path)
    end
  end
  
  describe 'when project has some radials' do
    it 'should display the name and description for each radial in this project' do
      # Add some radials to the project.
      radials = (1..6).map { Factory(:radial, :project => project) }
      
      # Visit the page.
      visit radials_project_path(project)
      
      # Check the contents.
      radials.each do |radial|
        page.should have_content(radial.name)
        page.should have_content(radial.description)
      end
    end
  end
end
