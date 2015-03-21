require 'rails_helper'

describe User do

  it 'has an admin flag' do
    user = User.new
    user.admin = true
    expect(user.admin?).to be true
  end

end
