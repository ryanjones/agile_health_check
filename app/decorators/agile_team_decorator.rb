class AgileTeamDecorator < Draper::Decorator
  decorates_association :score_cards

  delegate_all
end