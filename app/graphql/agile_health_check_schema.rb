require 'types/mutation_type'

class AgileHealthCheckSchema < GraphQL::Schema
  #mutation(Types::MutationType)
  query(Types::QueryType)
end
