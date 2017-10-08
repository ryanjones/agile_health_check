feature 'login' do
  let(:agile_team) { FactoryGirl.create(:agile_team) }
  let(:product_agile_team) { FactoryGirl.create(:product_agile_team) }

  let(:user) do
    user = User.create!(email: "user@example.org", password: "very-secret")
    sign_in user
    user
  end

  it 'should allow a user to login and see the agile teams', js: true do
    agile_team
    product_agile_team
    user
    
    visit(dashboards_path)

    expect(page).to have_content(agile_team.name)
    expect(page).to have_content(product_agile_team.name)
  end
  
  it "should deny access to unauthenticated users" do
    visit(dashboards_path)

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end