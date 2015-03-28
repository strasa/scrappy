require 'rails_helper'

describe Project, type: :model do

  it 'has a name' do
    user = create(:user)
    project = Project.create(name:'Test Project', description:'', user:user)
    expect(project.name).to eq('Test Project')
  end

end
