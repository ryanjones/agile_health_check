feature 'health check status' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }
  
  let(:setup_improved_score_cards) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: agile_team)
    
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_2, score: 1)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_2)
  end
  
  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  it 'should show that an agile team has improved', js: true do
    setup_improved_score_cards
    user
    visit(agile_team_path(agile_team))
    

    expect(page).to have_content('\u25BC')
  end

  pending 'should show that a team is not declining or improving'
  pending 'should show that a team has declined'
end