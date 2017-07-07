class ScoreCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score_card, only: [:show, :edit, :update, :destroy]


  def create
    score_card = ScoreCard.create!(agile_team: AgileTeam.find(score_card_params[:agile_team_id]))
    
    Question.all.each do |q|
      ScoreCardAnswer.create!(score_card: score_card, question: q)
    end
    
    redirect_to score_card_path(score_card), notice: 'Health check created successfully.'
  end
  
  def show
    @score_card_answers = ScoreCardAnswer.includes(:question).where(score_card: @score_card).all
  end
  
  def edit
  end

  def update
    require "pry"; binding.pry
    if @score_card.update(test_params)
      redirect_to @score_card, notice: 'Health check was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @score_card.destroy
    redirect_to root_path, notice: 'Health check deleted successfully.'
  end

  private
  
  def score_card_params
    params.require(:score_card).permit(:agile_team_id)
  end

  def set_score_card
    @score_card = ScoreCard.find(params[:id])
  end

end


