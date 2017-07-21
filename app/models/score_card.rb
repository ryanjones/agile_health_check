class ScoreCard < ApplicationRecord
  belongs_to :agile_team
  has_many :score_card_answers, dependent: :destroy
  has_many :questions, through: :score_card_answers
  
  accepts_nested_attributes_for :score_card_answers

  audited
end
