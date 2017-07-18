FactoryGirl.define do
  factory :agile_team_question_1, class: Question do
    title 'Delivering Value - Agile'
    kind :team_health_check
  end

  factory :agile_team_question_2, class: Question do
    title 'Easy to Release - Agile'
    kind :team_health_check
  end

  factory :agile_team_question_3, class: Question do
    title 'Fun - Agile'
    kind :team_health_check
  end

  factory :product_team_question_1, class: Question do
    title 'Delivering Value - Product Owner'
    kind :product_owner_health_check
  end

  factory :product_team_question_2, class: Question do
    title 'Fun - Product Owner'
    kind :product_owner_health_check
  end

  factory :application_question_1, class: Question do
    title 'Automated Tests - Application'
    kind :application_health_check
  end

  factory :application_question_2, class: Question do
    title 'Disaster Recovery - Application'
    kind :application_health_check
  end
end