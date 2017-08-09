feature 'health check status' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }
  let(:product_agile_team) { FactoryGirl.create(:product_agile_team) }
  
  let(:setup_improved_score_cards) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: agile_team)
    
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_2, score: 1)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_2)
  end

  let(:setup_neutral_score_cards) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: agile_team)

    FactoryGirl.create(:team_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_2)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_2)
  end

  let(:setup_declined_score_cards) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: agile_team)

    FactoryGirl.create(:team_score_card_answer, score_card: score_card_1, score: 2)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_1, score: 2)
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_2)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_2)
  end

  let(:setup_app_health_variance) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: agile_team)

    FactoryGirl.create(:team_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_1, score: 2)
    FactoryGirl.create(:team_score_card_answer, score_card: score_card_2, score: 1)
    FactoryGirl.create(:application_score_card_answer, score_card: score_card_2)
  end

  let(:setup_po_score_cards) do
    score_card_1 = FactoryGirl.create(:score_card, agile_team: product_agile_team)
    score_card_2 = FactoryGirl.create(:score_card, agile_team: product_agile_team)

    FactoryGirl.create(:po_score_card_answer, score_card: score_card_1, score: 0)
    FactoryGirl.create(:po_score_card_answer, score_card: score_card_2, score: 2)
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

    expect(page).to have_content('50%▲')
  end

  it 'should show that a team is not declining or improving' do
    setup_neutral_score_cards
    user
    visit(agile_team_path(agile_team))

    expect(page).to have_content('0%―')
  end
  
  it 'should show that a team has declined' do
    setup_declined_score_cards
    user
    visit(agile_team_path(agile_team))
    
    expect(page).to have_content('0%▼')
  end
  
  it 'should show improvement and decline in both app and health checks' do
    setup_app_health_variance
    user
    visit(agile_team_path(agile_team))

    expect(page).to have_content('0%▼')
    expect(page).to have_content('50%▲')
  end
  
  it 'should show improvement or decline in product owner health checks' do
    setup_po_score_cards
    user
    visit(agile_team_path(product_agile_team))

    expect(page).to have_content('100%▲')
  end
end