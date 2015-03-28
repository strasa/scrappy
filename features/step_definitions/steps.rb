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

Given(/^I am a regular user$/) do
  @user = create :user
end

Given(/^I have a Project$/) do
  @project = Project.create(name:'Test Project', description:'Test Description', user:@user)
end

When(/^I go to the Change Material Price Page$/) do
  # add at least one guaranteed element to the page - this should be in the seed
  @copper = Material.where(name:'Copper').first_or_create
  visit materials_path
end

When(/^I go to the Main Page$/) do
  visit main_path
end

When(/^I update the price of Copper$/) do
  within(:css, "tr[id=material_#{@copper.id}]") do
    fill_in 'material[price]', with: '2.00'
    click_on 'Update'
  end
end

When(/^I create a Project$/) do
  visit main_path
  find(:css, ".modal-trigger").click
  fill_in 'project[name]', with: 'Test Project'
  fill_in 'project[description]', with: 'Test Project Description'
  click_on 'Create'
end

Then(/^I should see that updated price on the Materials Page$/) do
  # first reload the model so we make sure the data is not just carried forward.
  expect(@copper.reload.price).to eq(2.00)
  # check that it's displaying on the page
  visit materials_path
  expect(page).to have_selector("input[value='2.00']")
end

Then(/^I should get a no page error$/) do
  # make sure the CanCan redirect is working
  expect(page.status_code).to eq(200)
  expect(page).to have_content('You are not authorized to access this page.')
end

Then(/^I should see the Change Material Price Link$/) do
  expect(page).to have_selector(:link, 'Change Material Prices')
end

Then(/^I should not see the Change Material Price Link$/) do
  expect(page).to_not have_selector(:link, 'Change Material Prices')
end

Then(/^I should see that Project$/) do
  visit main_path
  expect(page).to have_content('Test Project')
end
