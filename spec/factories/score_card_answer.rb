FactoryGirl.define do
  factory :score_card_answer, class: ScoreCardAnswer do
    association :score_card
    association :question, factory: :agile_team_question_1

    score 0
  end
end