require 'spec_helper'

describe 'suggestions/new.html.haml' do
  before(:each) do
    visit new_suggestion_path
  end

  it 'renders new suggestion form' do
    page.should have_selector('form', {:action => suggestions_path, :method => 'post'})
    
    page.find('form').tap do |form|
      form.should have_selector('input', {:id => 'suggestion_title', :name => 'suggestion[title]'})
      form.should have_selector('input', {:id => 'suggestion_description', :name => 'suggestion[description]'})
      
      # These should not be settable by the user.
      # form.should_not have_selector('input', {:id => 'suggestion_project_id', :name => 'suggestion[project_id]'})
      # form.should have_selector('input', {:id => 'suggestion_user_id', :name => 'suggestion[user_id]'})
    end
  end
end
