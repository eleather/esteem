class SuggestionVotesController < ApplicationController
  # GET /suggestion_votes
  # GET /suggestion_votes.json
  def index
    @suggestion_votes = SuggestionVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suggestion_votes }
    end
  end

  # GET /suggestion_votes/1
  # GET /suggestion_votes/1.json
  def show
    @suggestion_vote = SuggestionVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @suggestion_vote }
    end
  end

  # GET /suggestion_votes/new
  # GET /suggestion_votes/new.json
  def new
    @suggestion_vote = SuggestionVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @suggestion_vote }
    end
  end

  # GET /suggestion_votes/1/edit
  def edit
    @suggestion_vote = SuggestionVote.find(params[:id])
  end

  # POST /suggestion_votes
  # POST /suggestion_votes.json
  def create
    @suggestion_vote = SuggestionVote.new(params[:suggestion_vote])

    respond_to do |format|
      if @suggestion_vote.save
        format.html { redirect_to @suggestion_vote.suggestion.project, notice: 'Suggestion vote was successfully created.' }
        format.json { render json: @suggestion_vote, status: :created, location: @suggestion_vote.suggestion.project }
      else
        format.html { render action: "new" }
        format.json { render json: @suggestion_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /suggestion_votes/1
  # PUT /suggestion_votes/1.json
  def update
    @suggestion_vote = SuggestionVote.find(params[:id])

    respond_to do |format|
      if @suggestion_vote.update_attributes(params[:suggestion_vote])
        format.html { redirect_to @suggestion_vote, notice: 'Suggestion vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @suggestion_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestion_votes/1
  # DELETE /suggestion_votes/1.json
  def destroy
    @suggestion_vote = SuggestionVote.find(params[:id])
    @suggestion_vote.destroy

    respond_to do |format|
      format.html { redirect_to suggestion_votes_url }
      format.json { head :ok }
    end
  end
end
