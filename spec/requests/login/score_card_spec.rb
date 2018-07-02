feature 'health check' do
  let(:agile_team) { FactoryBot.create(:agile_team) }
  let(:product_agile_team) { FactoryBot.create(:product_agile_team) }
  
  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end
  
  let(:question) do
    FactoryBot.create(:agile_team_question_1)
    FactoryBot.create(:agile_team_question_2)
    FactoryBot.create(:agile_team_question_3)
    FactoryBot.create(:product_team_question_1)
    FactoryBot.create(:product_team_question_2)
    FactoryBot.create(:application_question_1)
    FactoryBot.create(:application_question_2)
  end

  it 'should show where the app health checks end and application health checks start' do
    agile_team
    user
    question
    visit(agile_team_path(agile_team))

    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).to have_content('Application Check Questions')
    visit(score_card_path(ScoreCard.last))
    expect(page).to have_content('Application Check Questions')
  end

  it 'should only show health check questions for product teams' do
    product_agile_team
    user
    question
    visit(agile_team_path(product_agile_team))

    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).not_to have_content('Application Check Questions')
    visit(score_card_path(ScoreCard.last))
    expect(page).not_to have_content('Application Check Questions')
  end

  it 'should not show duplicate app health check questions' do
    agile_team
    user
    question
    visit(agile_team_path(agile_team))

    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).to have_content('Application Check Questions')
    visit(score_card_path(ScoreCard.last))
    expect(page).not_to have_content('Disaster Recovery - Application', count: 2)
  end
end