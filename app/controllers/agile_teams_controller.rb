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

    # build multi-array to store question and answers
    results_array = [[]]
    
    # determine the size of the results array, maxing at 6
    if score_cards.count < 5
      score_cards.count.times{ |_a| results_array << [] }
    else
      5.times{ |_a| results_array << [] } 
    end
    
    # dump questions into the first array within results_array and populate the other arrays with answers
    question_array = []
    array_answer_count = 1
    score_cards.each do |sc|
      sc.score_card_answers.each do |sca|
        question_array << sca.question.title if array_answer_count == 1
        results_array[array_answer_count] << sca.score
      end

      array_answer_count += 1
    end
    
    # combine question array and results_array (which is now full of answers)
    results_array[0] = question_array


    # We now have a results_array that looks like this: [[q], [a], [a], [a], [a], [a]]
    @answers = results_array
    @question_count = question_array.count
    @score_card_count = score_cards.count + 1
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
