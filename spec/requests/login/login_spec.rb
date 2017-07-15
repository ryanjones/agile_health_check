feature 'login' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }

  it 'should allow a user to create an account and see the agile teams', js: true do
    agile_team
    
    visit(new_user_registration_path)
    fill_in('Email', with: 'ryan@example.com')
    fill_in('Password', with: 'waffles')
    fill_in('Password confirmation', with: 'waffles')
    click_button('Sign up')

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content(agile_team.name)
  end
end