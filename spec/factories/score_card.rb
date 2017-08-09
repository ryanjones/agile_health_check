FactoryGirl.define do
  factory :score_card, class: ScoreCard do
    association :agile_team
  end
end