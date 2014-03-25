require 'spec_helper'

describe Post do
  let!(:post) { Post.create(title: "traffic", body: "traffic is bad in Boston", date: "2014-03-24", user: user, interest_group: interest_group ) }
  let!(:user) { User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher') }
  let!(:interest_group) { InterestGroup.create(group_name: 'Good Christians', creator: user)}
  let!(:comment) {Comment.create(body: "i'm hungry", user: user, post: post)}

    describe 'validations' do
      context "when given valid attributes" do
        it "is valid" do
          expect(post).to be_valid
        end
      end

      it 'requires a title' do
        post.title = nil
        expect(post).to_not be_valid
        expect(post.errors[:title]).to include("can't be blank")
      end

      it 'requires a body' do
        post.body = nil
        expect(post).to_not be_valid
        expect(post.errors[:body]).to include("can't be blank")
      end

      it 'requires a date' do
        post.date = nil
        expect(post).to_not be_valid
        expect(post.errors[:date]).to include("can't be blank")
      end

      it 'requires a user' do
        post.user = nil
        expect(post).to_not be_valid
        expect(post.errors[:user]).to include("can't be blank")
      end

      it 'requires an interest group' do
        post.interest_group = nil
        expect(post).to_not be_valid
        expect(post.errors[:interest_group]).to include("can't be blank")
      end
    end

    describe 'associations' do
      it 'has many comments' do
        expect(post.comments).to include(comment)
      end

      it 'belongs to user' do
        expect(post.user_id).to eq(user.id)
      end

      it 'belongs to an interest group' do
        expect(post.interest_group_id).to eq(interest_group.id)
      end
    end

end
