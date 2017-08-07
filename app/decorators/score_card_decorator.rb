class ScoreCardDecorator < Draper::Decorator
  delegate_all

  def trend_health(next_score)
    return if next_score.blank?
    if next_score.health_check_average.to_d > self.health_check_average.to_d
      "\u25BC"
    elsif next_score.health_check_average.to_d == self.health_check_average.to_d
      "\u2015"
    elsif next_score.health_check_average.to_d < self.health_check_average.to_d
      "\u25B2"
    end
  end

  def trend_app(next_score)
    return if next_score.blank?
    if next_score.application_check_average.to_d > self.application_check_average.to_d
      "\u25BC"
    elsif next_score.application_check_average.to_d == self.application_check_average.to_d
      "\u2015"
    elsif next_score.application_check_average.to_d < self.application_check_average.to_d
      "\u25B2"
    end
  end

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

  def color(unicode)
    return 'green-text' if unicode == "\u25B2"
    return 'yellow-text' if unicode == "\u2015"
    return 'red-text' if unicode == "\u25BC"
  end
  
  def created_at_pretty
    object.created_at.strftime("%B %d, %Y %l:%M %p")
  end
end