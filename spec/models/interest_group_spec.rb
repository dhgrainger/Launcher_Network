require 'spec_helper'

describe InterestGroup do
  let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
  let!(:interest_group) { InterestGroup.create(group_name: 'Good Christians', creator: user)}
  let!(:post) { Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group) }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        expect(interest_group).to be_valid
      end
    end

    it 'requires a group name' do
      interest_group.group_name = nil
      expect(interest_group).to_not be_valid
      expect(interest_group.errors[:group_name]).to include "can't be blank"
    end

    it 'requires a creator' do
       interest_group.creator = nil
      expect(interest_group).to_not be_valid
      expect(interest_group.errors[:creator]).to include "can't be blank"
    end
  end

  describe 'associations' do

    it 'should have a creator' do
      expect(interest_group.creator).to eq user
    end

    it 'should have many posts' do
      expect(interest_group.posts).to include(post)
    end
  end

  # describe 'methods' do
  #   it 'should calculate the number of posts in a group'
  #   it 'should return the 3 most popular posts'
  # end
end


























