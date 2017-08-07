feature 'health check status' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }
  let(:score_card_answer) { FactoryGirl.create(:score_card_answer) }
  
  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  it 'should show that an agile team has improved', js: true do
    score_card_answer
    user
    visit(agile_team_path(score_card_answer.score_card.agile_team))

    save_and_open_screenshot
    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).to have_content('Delivering Value - Agile')
    expect(page).to have_content('Automated Tests - Application')
    expect(page).not_to have_content('Fun - Product Owner')
  end
end