feature 'dashboard' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }

  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  let(:question) do
    FactoryGirl.create(:agile_team_question_1)
    FactoryGirl.create(:agile_team_question_2)
    FactoryGirl.create(:agile_team_question_3)
  end

  it 'should display the most recent health check' do
    agile_team
    question
    current_score = FactoryGirl.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 3.years)
    FactoryGirl.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 1.years)
    FactoryGirl.create(:score_card, agile_team: agile_team, created_at: DateTime.now + 2.years)
    user
    visit(root_path)

    expect(page).to have_content(ScoreCardDecorator.new(current_score).created_at_pretty, count: 2)
  end
end