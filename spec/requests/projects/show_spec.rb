require 'spec_helper'

describe "projects/show.html.haml" do
  let :project do
    Factory(:project)
  end
  
  it 'should render the correct record attributes' do
    visit project_path(project)
    page.should have_content(project.name)
    page.should have_content(project.slug)
    page.should have_content(project.description)
    page.should have_link(project.organization.name, :href => organization_path(project.organization))
  end
  
  describe 'in #radials section' do    
    describe 'when this project has no radials' do
      before(:each) do
        visit project_path(project)
      end
      
      it 'should not display the section' do
        page.should_not have_selector('#radials')
      end
      
      it 'should not have a link to the radials view' do
        page.should_not have_link('Learn More', :href => radials_project_path(project))
      end
    end
    
    describe 'when this project has some radials' do
      let :radials do
        project
        (1..6).map { Factory(:radial, :project => project) }
      end
      
      it 'should display recent question responses aggregated by radial' do
        # Set expectations.
        Project.should_receive(:find).and_return(project)
        project.should_receive(:radials).and_return(radials)
        radials[0].should_receive(:score).twice.and_return(1.0)
        radials[1].should_receive(:score).twice.and_return(2.0)
        radials[2].should_receive(:score).twice.and_return(2.3)
        radials[3].should_receive(:score).twice.and_return(3.0)
        radials[4].should_receive(:score).twice.and_return(4.0)
        radials[5].should_receive(:score).twice.and_return(5.0)
      
        # Visit the page.
        visit project_path(project)
      
        # Check the content.
        page.should have_selector('#radials')

        radial_divs = page.all('#radials > #data > .radial-score')
        radial_divs.size.should == radials.size
        radial_divs.each_index do |i|
          radial_divs[i].find('.name').text.strip.should eq(radials[i].name)
          radial_divs[i].find('.score').text.strip.should eq(radials[i].score.to_s)
        end
      end
    
      it 'should have a link to a page giving more information about the radials for this project' do
        # Add some radials to this project.
        radials
        
        # Visit the page.
        visit project_path(project)
        
        # Check the content.
        page.should have_link('Learn More', :href => radials_project_path(project))
      end
    
      it 'should have a link to a view showing the trends of question responses aggregated by radial over time'
    end
  end
  
  describe 'in #questions section' do
    describe 'when this project has no questions' do
      it 'should not display the section' do
        visit project_path(project)
        page.should_not have_selector('#questions')
      end
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
    
    it 'should have a link to a view showing the trends of question responses aggregated by radial over time'
  end
  
  describe 'in #suggestions section' do
    def check_for_new_suggestion_box
      visit project_path(project)
      
      page.should have_selector('#suggestions')
      suggestions_div = page.find('#suggestions')
      
      suggestions_div.should have_selector('#new-suggestion')
      suggestions_div.find('#new-suggestion') do |div|
        div.should have_content('What\'s your suggestion?')
      end
    end
    
    # Make sure new-suggestion box works, either with a spec here or elsewhere.
    # Make sure suggestion partial contains the correct information, either here or elsewhere.
    
    describe 'when this project has no suggestions' do
      it 'should display the new suggestion box at the top of the section' do
        check_for_new_suggestion_box
      end
      
      it 'should have no other content' do
        visit project_path(project)
        page.all('#suggestions > *').size.should eq(1)
      end
    end
    
    describe 'when this project has less than 8 suggestions' do
      let :suggestions do
        project
        (1..5).map { Factory(:suggestion, :project => project) }
      end
      
      it 'should display the new suggestion box at the top of the section' do
        check_for_new_suggestion_box
      end
      
      it 'should display all suggestions for this project, in most-voted order' do
        Project.should_receive(:find).and_return(project)
        project.should_receive(:suggestions).and_return(suggestions)
        suggestions[0].should_receive(:vote_score).twice.and_return(1)
        suggestions[1].should_receive(:vote_score).twice.and_return(3)
        suggestions[2].should_receive(:vote_score).twice.and_return(5)
        suggestions[3].should_receive(:vote_score).twice.and_return(-2)
        suggestions[4].should_receive(:vote_score).twice.and_return(-4)
        
        visit project_path(project)
        
        suggestion_divs = page.all('#suggestions > .suggestion')
        suggestion_divs.size.should == suggestions.size
        suggestion_divs.map { |d| d.find('.title').text.strip }.should == [suggestions[2].title, suggestions[1].title, suggestions[0].title, suggestions[3].title, suggestions[4].title]
      end
    end

    describe 'when this project has more than 8 suggestions' do
      let :suggestions do
        project
        (1..10).map { Factory(:suggestion, :project => project) }
      end
      
      it 'should display the new suggestion box at the top of the section' do
        check_for_new_suggestion_box
      end
      
      it 'should display the 8 most recent suggestions for this project, in most-voted order' do
        Project.should_receive(:find).and_return(project)
        project.should_receive(:suggestions).and_return(suggestions)
        suggestions[0].should_receive(:vote_score).twice.and_return(0)
        suggestions[1].should_receive(:vote_score).twice.and_return(1)
        suggestions[2].should_receive(:vote_score).twice.and_return(2)
        suggestions[3].should_receive(:vote_score).twice.and_return(3)
        suggestions[4].should_receive(:vote_score).twice.and_return(4)
        suggestions[5].should_receive(:vote_score).twice.and_return(-1)
        suggestions[6].should_receive(:vote_score).twice.and_return(-2)
        suggestions[7].should_receive(:vote_score).twice.and_return(-2)
        suggestions[8].should_receive(:vote_score).and_return(-3)
        suggestions[9].should_receive(:vote_score).and_return(-4)
        
        visit project_path(project)
        
        suggestion_divs = page.all('#suggestions > .suggestion')
        suggestion_divs.size.should == 8
        suggestion_divs.map { |d| d.find('.title').text.strip }.should == [suggestions[4].title, suggestions[3].title, suggestions[2].title, suggestions[1].title, suggestions[0].title, suggestions[5].title, suggestions[6].title, suggestions[7].title]
      end
    end
  end
end
