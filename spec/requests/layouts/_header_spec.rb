require 'spec_helper'
 
# Use main#index to test the application layout since it can't be rendered 
# correctly independently. 

describe 'the header layout partial' do
  before(:each) do
    visit root_path
  end
  
  describe 'when the user is logged out' do
    it 'should have a login link' do
      page.should have_link('Login', :href => new_user_session_path)
    end
  end
  
  describe 'when the user is logged in' do
    before(:all) do
      # Create a User account, fake it's confirmation
      @user = Factory(:user)
    end
    
    before(:each) do
      # Login as that User
      visit new_user_session_path
      fill_in('user_email', :with => @user.email)
      fill_in('user_password', :with => 'secret')
      click_button('Sign in')
    end
    
    it 'should not have a login link' do
      page.should_not have_link('Login')
    end
    
    it 'should display the users email linking to the user edit page' do
      page.should have_content(@user.email)
    end
  end
end