module Types
  class AgileTeamType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :kind, String, null: false
    end
end