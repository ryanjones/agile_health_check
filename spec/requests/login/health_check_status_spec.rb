feature 'health check status' do
  let(:score_card) { FactoryGirl.create(:score_card) }
  let(:team_score_card_answer) { FactoryGirl.create(:team_score_card_answer, score_card: score_card) }
  let(:application_score_card_answer) { FactoryGirl.create(:application_score_card_answer, score_card: score_card) }
  
  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  it 'should show that an agile team has improved', js: true do
    score_card
    team_score_card_answer
    application_score_card_answer
    user
    visit(agile_team_path(score_card.agile_team))

    expect(page).to have_content('0%')
  end

  pending 'should show that a team is not declining or improving'
  pending 'should show that a team has declined'
end