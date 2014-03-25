require 'spec_helper'

describe User do

let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
let!(:post) { Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group) }
let!(:comment) {Comment.create(body: "i'm hungry", user: user, post: post)}
let!(:interest_group) { InterestGroup.create(group_name: 'really good Christians', creator: user)}

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        expect(user).to be_valid
      end
    end

    it 'requires a first name' do
      user.first_name = nil
      expect(user).to_not be_valid
      expect(user.errors[:first_name]).to include "can't be blank"
    end

    it 'requires a last name' do
      user.last_name = nil
      expect(user).to_not be_valid
      expect(user.errors[:last_name]).to include "can't be blank"
    end

    it 'requires a email address' do
      user.email_address = nil
      expect(user).to_not be_valid
      expect(user.errors[:email_address]).to include "can't be blank"
    end

    it 'requires a launcher or ee designation' do
      user.launcher_or_ee = nil
      expect(user).to_not be_valid
      expect(user.errors[:launcher_or_ee]).to include "can't be blank"
    end
  end

  describe 'associations' do
    it 'should have many interest groups' do
      user.interest_groups << interest_group
      expect(user.interest_groups).to include(interest_group)
    end

    it 'should have many posts' do
      expect(user.posts).to include(post)
    end

    it 'should have many comments' do
      expect(user.comments).to include(comment)
    end
  end

  describe 'methods' do
    it 'should name all of the groups a user belongs to' do
    interest_group1 = InterestGroup.create(group_name: 'Good Christians', creator: user)
    interest_group2 = InterestGroup.create(group_name: 'Bad Christians', creator: user)
    interest_group3 = InterestGroup.create(group_name: 'Okay Christians', creator: user)
    user.interest_groups << interest_group1
    user.interest_groups << interest_group2
    user.interest_groups << interest_group3

    expect(user.name_of_groups).to eql(['Good Christians', 'Bad Christians', 'Okay Christians'])
    end

    it 'should count the number of posts a user has made' do
     post1 = Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group)
     post2 = Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group)
     post3 = Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group)
     expect(user.count_posts).to eql(4)
    end

    it 'should count the number of comments a user has made' do
     c1 = Comment.create(body: "i'm hungry", user: user, post: post)
     c2 = Comment.create(body: "i'm hungry", user: user, post: post)
     c3 = Comment.create(body: "i'm hungry", user: user, post: post)
     expect(user.count_comments).to eql(4)
    end

  end
end
