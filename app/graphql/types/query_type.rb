module Types
  class QueryType < Types::BaseObject

    field :agile_teams, [Types::AgileTeamType, null: true], null: false

    def agile_teams(**_args)
      AgileTeam.all
    end

  end
end