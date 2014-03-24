require 'spec_helper'

describe Comment do
  # it { should belong_to :post }
  # it { should belong_to :user }

let(:valid_attrs) { { body: "i'm hungry", user_id: 4, post_id: 4 } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        comment = Comment.new(valid_attrs)
        expect(comment).to be_valid
      end
    end

    it 'requires a post' do
      comment = Comment.new
      comment.valid?
      expect(comment.errors[:post_id]).to include "can't be blank"
    end

    it 'requires a user' do
      comment = Comment.new
      comment.valid?
      expect(comment.errors[:user_id]).to include "can't be blank"
    end
  end

  describe 'associations' do
    it 'belongs to users' do
      user = User.create(first_name: 'lydia', last_name: 'ho', email_address: 'lydia@sloppymail.com', launcher_or_ee: 'launcher')

       comment = Comment.create(valid_attrs)

       expect(comment.user_id).to eq(user.id)
    end
  end
end
