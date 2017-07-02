class ScoreCard < ApplicationRecord
  belongs_to :agile_team
  has_many :score_card_answers
end
