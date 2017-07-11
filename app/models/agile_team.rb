class AgileTeam < ApplicationRecord
  has_many :score_cards

  enum kind: [ :agile_team, :product_team ]
  
  validates :kind, presence: true
end
