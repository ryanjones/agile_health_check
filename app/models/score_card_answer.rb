class ScoreCardAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :score_card

  enum score: [ :no_value, :red, :yellow, :green ]
end
