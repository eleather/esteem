require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      login_user
      visit projects_path
      page.status_code.should eq(200)
    end
  end
end
