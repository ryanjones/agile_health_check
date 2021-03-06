FactoryBot.define do
  factory :team_score_card_answer, class: ScoreCardAnswer do
    association :score_card
    association :question, factory: :agile_team_question_1

    score 0
  end
  
  factory :application_score_card_answer, class: ScoreCardAnswer do
    association :score_card
    association :question, factory: :application_question_1

    score 0
  end

  factory :po_score_card_answer, class: ScoreCardAnswer do
    association :score_card
    association :question, factory: :product_team_question_1

    score 0
  end
end