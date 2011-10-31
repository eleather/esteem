require 'spec_helper'
 
# Use main#index to test the application layout since it can't be rendered 
# correctly independently. 

describe 'the header layout partial' do
  
  def set_header_div
    visit root_path
    
    page.should have_selector('#header-partial')
    @header_div = page.find('#header-partial')
  end
  
  
  describe 'in the #logo section' do
    before(:each) do
      set_header_div
      
      @header_div.should have_selector('#logo')
      @logo_div = @header_div.find('#logo')
    end
    
    it 'should display a logo image'
    
    it 'should link to the main page' do
      @logo_div.should have_link('Esteem', :href => root_path)
    end
  end
  
  
  describe 'in the #session-management section' do
    def set_session_management_div
      @header_div.should have_selector('#session-management')
      @session_management_div = @header_div.find('#session-management')
    end
    
    describe 'when the user is logged out' do    
      before(:each) do
        set_header_div
        set_session_management_div
      end
      
      it 'should have a sign up link' do
        @session_management_div.should have_link('Sign up', :href => new_user_registration_path)
      end
    
      it 'should have a log in link' do
        @session_management_div.should have_link('Log in', :href => new_user_session_path)
      end
    end
  
    describe 'when the user is logged in' do
      let :user do
        Factory(:user)
      end
    
      before(:each) do
        # Login as that User
        visit new_user_session_path
        fill_in('user_email', :with => user.email)
        fill_in('user_password', :with => 'secret')
        click_button('Sign in')
        
        set_header_div
        set_session_management_div
      end
    
      it 'should not have a sign up link' do
        @session_management_div.should_not have_link('Sign up')
      end
    
      it 'should not have a log in link' do
        @session_management_div.should_not have_link('Log in')
      end
    
      it 'should display the users email linking to the user edit page' do
        @session_management_div.should have_content(user.email)
      end
    
      it 'should have a log out link' do
        @session_management_div.should have_link('Log out', {:href => destroy_user_session_path, 'data-method' => 'delete'})
      end
    end
  end
end