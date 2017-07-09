class ScoreCardAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :score_card

  enum score: { TBD: 0, Red: 1, Yellow: 2, Green: 3 }

end
