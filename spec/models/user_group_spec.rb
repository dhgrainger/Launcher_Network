require 'spec_helper'

describe UserGroup do
  let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
  let!(:interest_group) { InterestGroup.create(group_name: 'Good Christians', creator: user)}
  let!(:user_group) {UserGroup.new(user: user, interest_group: interest_group)}

  it 'should belong to a user' do
    expect(user_group).to respond_to(:user)
  end

  it 'should belong to a user' do
    expect(user_group).to respond_to(:interest_group)
  end

  it 'should have a user' do
    user_group.user = nil
    expect(user_group).to_not be_valid
    expect(user_group.errors[:user]).to include("can't be blank")
  end

   it 'should have an interest_group' do
    user_group.interest_group = nil
    expect(user_group).to_not be_valid
    expect(user_group.errors[:interest_group]).to include("can't be blank")
  end
end
