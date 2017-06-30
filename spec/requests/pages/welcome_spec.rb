feature 'welcome' do
  it 'should have a login link', js: true do
    visit(root_path)
    expect(page).to have_content('Login')
  end
end