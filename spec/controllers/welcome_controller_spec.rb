require 'rails_helper'

describe WelcomeController, type: :controller do

  it 'returns the users projects' do
    project = create :project
    sign_in project.user
    get :main
    expect(assigns(:projects)).to be_present
  end

  it 'returns projects when user has none' do
    sign_in create(:user)
    get :main
    expect(assigns(:projects)).to_not be_nil
  end
end
