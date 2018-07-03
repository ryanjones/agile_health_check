feature 'dashboard' do
  let(:agile_team) { FactoryBot.create(:agile_team) }

  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  let(:question) do
    FactoryBot.create(:agile_team_question_1)
    FactoryBot.create(:agile_team_question_2)
    FactoryBot.create(:agile_team_question_3)
  end

  it 'should display the most recent health check' do
    agile_team
    question
    current_score = FactoryBot.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 3.years)
    FactoryBot.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 1.years)
    FactoryBot.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 2.years)
    user
    visit(root_path)

    expect(page).to have_content(ScoreCardDecorator.new(current_score).created_at_pretty, count: 2)
  end
end