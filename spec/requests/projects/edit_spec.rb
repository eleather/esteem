require 'spec_helper'

describe 'projects/edit.html.haml' do
  let :project do
    Factory(:project)
  end
  
  let :radials do
    project
    (1..3).map { Factory(:radial, :project => project) }
  end
  
  let :questions do
    project
    (1..3).map { Factory(:question, :project => project) }
  end
  
  
  before(:each) do
    login_user
  end


  it 'renders the edit project form' do
    visit edit_project_path(project)
    
    page.should have_selector('form', {:action => projects_path, :method => 'post'})
    
    page.find('form').tap do |form|
      form.should have_selector('input', {:id => 'project_title', :name => 'project[title]'})
      form.should have_selector('input', {:id => 'project_description', :name => 'project[description]'})
      form.should have_selector('input', {:id => 'project_project_id', :name => 'project[organization_id]', :type => 'hidden'})
    end
  end
  
  describe 'in #radials section' do
    describe 'when project has no radials' do
      it 'should display a link to add a new radial' do
        visit edit_project_path(project)
        page.should have_link('Add Radial', :href => new_radial_path(:project_id => project.id))
      end
    end
    
    describe 'when project has some radials' do
      before(:each) do
        radials
        visit edit_project_path(project)
        
        page.should have_selector('#radials')
        @radials_div = page.find('#radials')
      end
      
      it 'should display current radials' do
        radial_divs = @radials_div.all('.radial-description-partial')
        radial_divs.size.should eq(radials.size)
        radials.each_index do |i|
          radial_divs[i].should have_content(radials[i].name)
          radial_divs[i].should have_content(radials[i].description)
        end
      end
    
      it 'should display a link to add a new radial' do
        @radials_div.should have_link('Add Radial', :href => new_radial_path(:project_id => project.id))
      end
    end
  end
  
  describe 'in #questions section' do
    it 'should display current questions'
    it 'should display a link to tag a question with a new radial'
    it 'should display a link to remove a radial tag from a question'
    it 'should display a link to add a new question'
  end
end
