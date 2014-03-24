require 'spec_helper'

 # it { should have_many :comments }
 # it { should belong_to :user }
 # it { should belong_to :interest_group }
describe Post do
  let(:valid_attrs) { { author: "Lydia", title: "traffic", body: "traffic is bad in Boston", date: "2014-03-24", user_id: 4, interest_group_id: 4 } }

    describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        post = Post.new(valid_attrs)
        expect(post).to be_valid
      end
    end

    # it 'requires a post' do
    #   comment = Comment.new
    #   comment.valid?
    #   expect(comment.errors[:post_id]).to include "can't be blank"
    # end

    # it 'requires a user' do
    #   comment = Comment.new
    #   comment.valid?
    #   expect(comment.errors[:user_id]).to include "can't be blank"
    # end
  end

end
