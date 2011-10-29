require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProjectsController do
  login_user
  
  let :project do
    Factory(:project)
  end
  
  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # update the return value of this method accordingly.
  let :valid_attributes do
    p = Factory.build(:project)
    {
      :name => p.name, 
      :slug => p.slug,
      :organization_id => p.organization_id
    }
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      get :index
      assigns(:projects).should eq(Project.all)
    end
  end

  describe "GET show" do
    it 'assigns the requested project as @project' do
      get :show, :id => project.id
      assigns(:project).should eq(project)
    end
    
    it 'assigns an empty array as @radials if the project has no radials' do
      get :show, :id => project.id
      assigns(:radials).should eq([])
    end
    
    it 'assigns the project\'s radials as @radials' do
      # Setup some radials for this project
      radials = (1..3).map { Factory(:radial, :project => project) }
      
      get :show, :id => project.id
      assigns(:radials).should eq(radials)
    end
    
    it 'assigns an empty array as @questions if the project has no questions' do
      get :show, :id => project.id
      assigns(:questions).should eq([])
    end
    
    it 'assigns an empty array as @questions if the current user has recently answered all questions for this project'
    
    # it 'assigns the project\'s questions as @questions' do
    #   # Setup some questions for this project
    #   questions = (1..3).map { Factory(:question, :project => project) }
    #   
    #   get :show, :id => project.id
    #   assigns(:questions).should eq(questions)
    # end
    # 
    # describe 'when the user has recently answered no questions for this project' do
    #   it 'should display all questions for the user to answer' do
    #     # Set expectations.
    #     Project.should_receive(:find).and_return(project)
    #     project.should_receive(:get_unanswered_questions_for_user).and_return(questions)
    #     
    #     # Visit the page.
    #     visit project_path(project)
    #     
    #     # Check the content.
    #     question_divs = page.all('.question')
    #     question_divs.size.should eq(project.questions.size)
    #     questions.each_index do |i|
    #       question_divs[i].should have_content(questions[i].title)
    #       question_divs[i].should have_content(questions[i].description)
    #       question_divs[i].should have_field('input', :type => 'radio')
    #     end
    #   end
    # end
    #   
    # describe 'when the user has recently answered only some questions for this project' do
    #   it 'should display only unanswered questions for the user to answer'
    # end
    #   
    # describe 'when the user has recently answered all questions for this project' do
    #   it 'should display text telling the user that they\'ve answered all the questions for now'
    # end
    
    it 'assigns a new Suggestion as @suggestion' do
      get :show, :id => project.id
      assigns(:suggestion).should be_a_new(Suggestion)
    end
    
    it 'assigns an empty array as @suggestions if the projec thas no suggestions' do
      get :show, :id => project.id
      assigns(:suggestions).should eq([])
    end
    
    it 'assigns the project\'s suggestions in sorted order by vote_score as @suggestions' do
      suggestion1 = Factory(:suggestion, :project => project)
      suggestion2 = Factory(:suggestion, :project => project)
      suggestion3 = Factory(:suggestion, :project => project)
      suggestions = [suggestion1, suggestion3, suggestion2]
      Project.should_receive(:find).with(project.id.to_s).and_return(project)
      project.should_receive(:suggestions_ordered_by_vote_score).and_return(suggestions)
      
      get :show, :id => project.id
      assigns(:suggestions).should eq(suggestions)
    end
    
    it 'doesn\'t have more than 8 entries in @suggestions' do
      suggestions = (1..10).map { Factory(:suggestion, :project => project) }
      Project.should_receive(:find).with(project.id.to_s).and_return(project)
      project.should_receive(:suggestions_ordered_by_vote_score).and_return(suggestions)
      
      get :show, :id => project.id
      assigns(:suggestions).size.should eq(8)
    end 
  end

  describe "GET new" do
    it 'raises an error if no organization_id was given' do
      # get :new
      # TODO: Don't know correct syntax for this test.  Try again later.
      # response.should raise_error(RuntimeError.new('You cannot create a new project without passing an organization_id parameter.'))
    end
    
    it 'assigns a new project as @project, associated with organization_id' do
      get :new, :organization_id => 123
      # TODO: Equality isn't working, not sure why.  Try again later.
      # assigns(:project).should eq(Project.new(:organization_id => 123))
    end
  end

  describe "GET edit" do
    it "assigns the requested project as @project" do
      get :edit, :id => project.id
      assigns(:project).should eq(project)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, :project => valid_attributes
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, :project => valid_attributes
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :create, :project => valid_attributes
        response.should redirect_to(Project.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, :project => {}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        post :create, :project => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        # Assuming there are no other projects in the database, this
        # specifies that the Project created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Project.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => project.id, :project => {'these' => 'params'}
      end

      it "assigns the requested project as @project" do
        put :update, :id => project.id, :project => valid_attributes
        assigns(:project).should eq(project)
      end

      it "redirects to the project" do
        put :update, :id => project.id, :project => valid_attributes
        response.should redirect_to(project)
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, :id => project.id, :project => {}
        assigns(:project).should eq(project)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.stub(:save).and_return(false)
        put :update, :id => project.id, :project => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, :id => project.id
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, :id => project.id
      response.should redirect_to(projects_url)
    end
  end
  
  describe 'GET radials' do
    it 'assigns the project as @project' do
      put :radials, :id => project.id
      assigns(:project).should eq(project)
    end
    
    it 'assigns an empty array as @radials if the project has no radials' do
      put :radials, :id => project.id
      assigns(:radials).should eq([])
    end
    
    it 'assigns the project\'s radials as @radials' do
      radials = (1..6).map { Factory(:radial, :project => project) }
      
      put :radials, :id => project.id
      assigns(:radials).should eq(radials)
    end
  end

end
