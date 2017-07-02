# Agile Health Check

This application is for facilitators of an agile health check (also known as a squad health check).

a = AgileTeam.create!(name:'awesome agile team')
s = ScoreCard.create!(agile_team:a)
q1 = Question.create!(text:'super question?', kind: 1)
sa = ScoreCardAnswer.create(score: 1)
sa.score_card = s
sa.question = q1
sa.save!
