class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @radials = @project.radials
    @questions = @project.get_unanswered_questions_for_user(current_user)
    @suggestions = @project.suggestions_ordered_by_vote_score.in_groups_of(8, false).first || []
    
    # New Suggestion for form
    @suggestion = Suggestion.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if (organization_id = params[:organization_id])
      @project = Project.new(:organization_id => organization_id)
    else
      raise RuntimeError.new('You cannot create a new project without passing an organization_id parameter.')
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
  
  # GET /projects/1/radials
  # GET /projects/1/radials.json
  def radials
    @project = Project.find(params[:id])
    @radials = @project.radials
    
    respond_to do |format|
      format.html # radials.html.haml
      format.json { render json: @radials }
    end
  end
  
  # POST /projects/1/answer_questions
  # POST /projects/1/answer_questions.json
  def answer_questions
    @project = Project.find(params[:id])
    @question_responses = []
    params[:question_responses].each do |question_id, response|
      @question_responses << QuestionResponse.create!(:question_id => question_id.to_i, :user => current_user, :response => response.to_i)
    end
    
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Your answers have been saved.  Thanks!' }
      format.json { render json: @question_responses, status: :created, location: @project }
    end
  end
end
