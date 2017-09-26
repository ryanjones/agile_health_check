class AgileTeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @agile_team = AgileTeam.find(params[:id]).decorate
    @score_cards = ScoreCardDecorator.decorate_collection(
      ScoreCard.where(agile_team: @agile_team).includes(:score_card_answers).includes(:questions).order(created_at: :desc)
    )
    @score_card = ScoreCard.new
    
    set_breadcrumbs
  end
  
  def health_progression
    @agile_team = AgileTeam.find(params[:id]).decorate
    score_cards = ScoreCard.where(agile_team: @agile_team).includes(:score_card_answers).includes(:questions).order(created_at: :desc).first(5)
    
    # qs, a, a, a, a, a
    answer_array = [[],[],[],[],[],[]]
    question_array = []
    
    array_answer_count = 1
    score_cards.each do |sc|
      sc.score_card_answers.each do |sca|
        question_array << sca.question.title if array_answer_count == 1
        answer_array[array_answer_count] << sca.score
      end

      array_answer_count += 1
    end
    
    answer_array[0] = question_array
    @question_count = question_array.count
    @answers = answer_array
    set_progression_breadcrumbs
  end
  
  private
  
  def set_breadcrumbs
    add_breadcrumb "Home", :root_path
    add_breadcrumb "#{@agile_team.name}", agile_team_path(@agile_team)
  end

  def set_progression_breadcrumbs
    add_breadcrumb "Home", :root_path
    add_breadcrumb "#{@agile_team.name}", agile_team_path(@agile_team)
    add_breadcrumb "Health Progression", health_progression_path(@agile_team)
  end
end
