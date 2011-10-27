require 'spec_helper'

describe 'questions/new.html.haml' do
  before(:each) do
    visit new_question_path
  end

  it 'renders the edit question form' do
    page.should have_selector('form', {:action => questions_path, :method => 'post'})
    
    page.find('form').tap do |form|
      form.should have_selector('input', {:id => 'question_title', :name => 'question[title]'})
      form.should have_selector('input', {:id => 'question_description', :name => 'question[description]'})
      form.should have_selector('input', {:id => 'question_project_id', :name => 'question[project_id]', :type => 'hidden'})
    end
  end
end