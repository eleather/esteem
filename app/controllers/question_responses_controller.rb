class QuestionResponsesController < ApplicationController
  # GET /question_responses
  # GET /question_responses.json
  def index
    @question_responses = QuestionResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_responses }
    end
  end

  # GET /question_responses/1
  # GET /question_responses/1.json
  def show
    @question_response = QuestionResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_response }
    end
  end

  # GET /question_responses/new
  # GET /question_responses/new.json
  def new
    @question_response = QuestionResponse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_response }
    end
  end

  # GET /question_responses/1/edit
  def edit
    @question_response = QuestionResponse.find(params[:id])
  end

  # POST /question_responses
  # POST /question_responses.json
  def create
    @question_response = QuestionResponse.new(params[:question_response])

    respond_to do |format|
      if @question_response.save
        format.html { redirect_to @question_response, notice: 'Question response was successfully created.' }
        format.json { render json: @question_response, status: :created, location: @question_response }
      else
        format.html { render action: "new" }
        format.json { render json: @question_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_responses/1
  # PUT /question_responses/1.json
  def update
    @question_response = QuestionResponse.find(params[:id])

    respond_to do |format|
      if @question_response.update_attributes(params[:question_response])
        format.html { redirect_to @question_response, notice: 'Question response was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_responses/1
  # DELETE /question_responses/1.json
  def destroy
    @question_response = QuestionResponse.find(params[:id])
    @question_response.destroy

    respond_to do |format|
      format.html { redirect_to question_responses_url }
      format.json { head :ok }
    end
  end
end
