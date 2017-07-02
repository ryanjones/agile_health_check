class ScoreCardAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :score_card
end
