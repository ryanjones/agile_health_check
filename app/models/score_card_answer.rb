class ScoreCardAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :score_card

  enum score: { Red: 0, Yellow: 1, Green: 2 }

  audited
  
  def score_value
    ScoreCardAnswer.scores[score]
  end
  
  def question_total
    ScoreCardAnswer.scores["Green"]
  end
end
