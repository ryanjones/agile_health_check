# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


AgileTeam.find_or_create_by!(name: 'Agile Team 1', kind: :agile_team)
AgileTeam.find_or_create_by!(name: 'Product Team', kind: :product_team)
AgileTeam.find_or_create_by!(name: 'Agile Team 2', kind: :agile_team)

team_questions = []
team_questions << { title: 'Delivering Value', type: :team_health_check }
team_questions << { title: 'Delivering Value', type: :product_owner_health_check }
team_questions << { title: 'Easy to Release', type: :team_health_check }
team_questions << { title: 'Fun', type: :team_health_check }
team_questions << { title: 'Fun', type: :product_owner_health_check }
team_questions << { title: 'Health of Codebase', type: :team_health_check }
team_questions << { title: 'Learning', type: :team_health_check }
team_questions << { title: 'Learning', type: :product_owner_health_check }
team_questions << { title: 'Mission', type: :team_health_check }
team_questions << { title: 'Mission', type: :product_owner_health_check }
team_questions << { title: 'Pawns or Players', type: :team_health_check }
team_questions << { title: 'Pawns or Players', type: :product_owner_health_check }
team_questions << { title: 'Code Quality', type: :team_health_check }
team_questions << { title: 'Suitable Process', type: :team_health_check }
team_questions << { title: 'Suitable Process', type: :product_owner_health_check }
team_questions << { title: 'Support', type: :team_health_check }
team_questions << { title: 'Support', type: :product_owner_health_check }
team_questions << { title: 'Teamwork', type: :team_health_check }
team_questions << { title: 'Teamwork', type: :product_owner_health_check }
team_questions << { title: 'Velocity', type: :team_health_check }
team_questions << { title: 'Post-mortem', type: :team_health_check }

team_questions.each do |q|
  Question.find_or_create_by!(title: q[:title], kind: q[:type] )
end

application_questions = []
application_questions << { title: 'Automated Tests', type: :application_health_check }
application_questions << { title: 'Disaster Recovery', type: :application_health_check }
application_questions << { title: 'Logging', type: :application_health_check }
application_questions << { title: 'Exception Handling', type: :application_health_check }
application_questions << { title: 'API Versioning', type: :application_health_check }
application_questions << { title: 'Test Coverage', type: :application_health_check }
application_questions << { title: 'Code Simplicity', type: :application_health_check }
application_questions << { title: 'Gated Check-ins', type: :application_health_check }
application_questions << { title: 'Outage Monitoring', type: :application_health_check }
application_questions << { title: 'Hipchat Integration', type: :application_health_check }
application_questions << { title: '0 Downtime Deploys', type: :application_health_check }
application_questions << { title: 'Emergency Rollbacks', type: :application_health_check }
application_questions << { title: 'Continuous Integration', type: :application_health_check }
application_questions << { title: 'Automated Deployments', type: :application_health_check }
application_questions << { title: 'Secret Management', type: :application_health_check }
application_questions << { title: 'Code Reviews', type: :application_health_check }

application_questions.each do |q|
  Question.find_or_create_by!(title: q[:title], kind: q[:type] )
end

