require 'spec_helper'

describe InterestGroup do
  let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
  let!(:interest_group) { InterestGroup.create(group_name: 'Good Christians', creator: user)}
  # let!(:post) { Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group) }

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
      post1 = Post.create(title: 'a', body: 'b', date: '2014-03-24', user: user, interest_group: interest_group)
      expect(interest_group.posts).to include(post1)
    end
  end

  describe 'methods' do
    it 'should calculate the number of posts in a group' do
      interest_group1 = InterestGroup.create(group_name: 'Good Christians', creator: user)
      post1 = Post.create(title: 'a', body: 'b', date: '2014-03-24', user: user, interest_group: interest_group1)
      post2 = Post.create(title: 'b', body: 'wer', date: '2014-03-26', user: user, interest_group: interest_group1)
      post3 = Post.create(title: 'c', body: 'ers', date: '2014-03-27', user: user, interest_group: interest_group1)
      post4 = Post.create(title: 'd', body: 'ert', date: '2014-03-24', user: user, interest_group: interest_group1)
      expect(interest_group1.numberofposts).to eql(4)
    end

    it 'should return the 3 most popular posts' do
      # user = User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher')
      post1 = Post.create(title: 'a', body: 'b', date: '2014-03-24', user: user, interest_group: interest_group)
      post2 = Post.create(title: 'b', body: 'wer', date: '2014-03-26', user: user, interest_group: interest_group)
      post3 = Post.create(title: 'c', body: 'ers', date: '2014-03-27', user: user, interest_group: interest_group)
      post4 = Post.create(title: 'd', body: 'ers', date: '2014-03-27', user: user, interest_group: interest_group)

      4.times do
        Comment.create(body: "i'm hungry", user: user, post: post4)
      end
      5.times do
        Comment.create(body: "i'm hungry", user: user, post: post1)
      end
      10.times do
        Comment.create(body: "i'm hungry", user: user, post: post2)
      end
      15.times do
        Comment.create(body: "i'm hungry", user: user, post: post3)
      end
      expect(interest_group.favorite).to eql(post3)
    end
  end
end
