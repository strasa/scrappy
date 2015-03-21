Given(/^I am an Admin$/) do
  @user = User.where(email: 'admin@testing.com').first_or_create
  @user.password = 'test'
  @user.password_confirmation = 'test'
  @user.admin = true
  @user.save!
end

Given(/^I am logged in$/) do
  login_as @user
end

When(/^I go to the Change Material Price Page$/) do
  visit materials_path
end

When(/^I update the price of Copper$/) do
  @copper = Material.where(name:'Copper').first
  within(:css, "li[id=material_#{@copper.id}]") do
    fill_in 'material[price]', with: '2.00'
    click_on 'Update'
  end
end

Then(/^I should see that updated price on the Materials Page$/) do
  # first reload the model so we make sure the data is not just carried forward.
  expect(@copper.reload.price).to eq(2.00)
  # check that it's displaying on the page
  visit materials_path
  expect(page).to have_selector("input[value='2.00']")
end
