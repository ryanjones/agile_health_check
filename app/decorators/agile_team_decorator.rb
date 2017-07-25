class AgileTeamDecorator < Draper::Decorator
  delegate_all
  
  def health_check_average
    score = 0
    size = 0
    
    object.score_card_answers.each do |sca|
      if sca.question.kind != "application_health_check"
        score = score + sca.score_value
        size = size + sca.question_total
      end
    end
    
    "#{((score.to_f / size) * 100 ).ceil}%" unless size == 0
  end
  
  def application_check_average
    score = 0
    size = 0
    
    object.score_card_answers.each do |sca|
      if sca.question.kind == "application_health_check"
        score = score + sca.score_value
        size = size + sca.question_total
      end
    end

    
    "#{((score.to_f / size) * 100 ).ceil}%" unless size == 0
  end
end