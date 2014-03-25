require 'spec_helper'

describe Comment do

let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
let!(:post) { Post.create(user: user, title: 'blah', body: 'blah', date: '11/12/2004', interest_group: interest_group) }
let!(:comment) {Comment.create(body: "i'm hungry", user: user, post: post)}
let!(:interest_group) { InterestGroup.create(group_name: 'Good Christians', creator: user)}

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        expect(comment).to be_valid
      end

      it 'requires a post' do
        comment.post = nil
        expect(comment).to_not be_valid
        expect(comment.errors[:post]).to include "can't be blank"
      end

      it 'requires a user' do
        comment.user = nil
        expect(comment).to_not be_valid
        expect(comment.errors[:user]).to include "can't be blank"
      end

      it "requires a body" do
        comment.body = nil
        expect(comment).to_not be_valid
        expect(comment.errors[:body]).to include "can't be blank"
      end
    end
  end

  describe 'associations' do
    it 'belongs to users' do
       expect(comment.user).to eq user
    end

    it 'belongs to posts' do
      expect(comment.post).to eq post
    end
  end
end
