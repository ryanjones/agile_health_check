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

  it 'should allow a user to create a health check for an agile team', js: true do
    agile_team
    user
    question
    visit(agile_team_path(agile_team))

    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).to have_content('Delivering Value - Agile')
    expect(page).to have_content('Automated Tests - Application')
    expect(page).not_to have_content('Fun - Product Owner')
  end

  it 'should allow a user to update their teams health check', js: true do
    agile_team
    user
    question
    visit(agile_team_path(agile_team))
    click_button 'Create a new health check'


    within(:css, '.question_1') do
      choose 'Yellow'
    end

    click_button 'Update answers'

    expect(page).to have_content('Health check was successfully updated.')
    expect(page).to have_css(".yellow-background")
  end
  

  it 'should allow a user to create a health check for a product team', js: true do
    product_agile_team
    user
    question
    visit(agile_team_path(product_agile_team))

    click_button 'Create a new health check'

    expect(page).to have_content('Health check created successfully.')
    expect(page).not_to have_content('Delivering Value - Agile')
    expect(page).not_to have_content('Automated Tests - Application')
    expect(page).to have_content('Fun - Product Owner')
  end

  it 'should allow a user to update their product teams health check', js: true do
    product_agile_team
    user
    question
    visit(agile_team_path(product_agile_team))
    click_button 'Create a new health check'


    within(:css, '.question_1') do
      choose 'Yellow'
    end

    click_button 'Update answers'

    expect(page).to have_content('Health check was successfully updated.')
    expect(page).to have_css(".yellow-background")
  end
  
  it "should destroy a health check", js: true do
    product_agile_team
    user
    question
    visit(agile_team_path(product_agile_team))
    click_button 'Create a new health check'
    click_button 'Update answers'
    accept_confirm do
      click_link 'Destroy health check'
    end

    expect(page).to have_content('Health check deleted successfully.')
  end
  
  pending "destroying a health check should audit the destroy"
end