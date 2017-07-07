class Question < ApplicationRecord
  has_many :score_card_answers

  enum kind: [ :team_health_check, :application_health_check, :product_owner_health_check ]
end
