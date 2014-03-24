require 'spec_helper'

describe User do

  let(:valid_attrs) { { first_name: 'Lydia', last_name: 'Ho', email_address: "Lydia@sloppy.com", launcher_or_ee: "launcher"} }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        lydia = User.new(valid_attrs)
        expect(lydia).to be_valid
      end
    end

    it 'requires a first name' do
      lydia = User.new
      lydia.valid?
      expect(lydia.errors[:first_name]).to include "can't be blank"
    end

    it 'requires a last name' do
      lydia = User.new
      lydia.valid?
      expect(lydia.errors[:last_name]).to include "can't be blank"
    end

    it 'requires a email address' do
      lydia = User.new
      lydia.valid?
      expect(lydia.errors[:email_address]).to include "can't be blank"
    end

    it 'requires a launcher or ee designation' do
      lydia = User.new
      lydia.valid?
      expect(lydia.errors[:launcher_or_ee]).to include "can't be blank"
    end

    it 'requires launcher or ee to be launcher or ee' do
      lydia = User.new(launcher_or_ee: 'student')
      lydia.valid?
      expect(lydia.errors[:launcher_or_ee]).to include "is not included in the list"
    end
  end

  describe 'associations' do
    it 'should have many interest groups' do
      lydia = User.new(valid_attrs)
      lydia.save!
      interestgroup = InterestGroup.create(group_name: "Good Christians", creator: "Lydia")
      lydia.interest_groups = [interestgroup]
      expect(lydia.interest_groups).to include(interestgroup)
    end

    it 'should have many posts' do
      lydia = User.new(valid_attrs)
      lydia.save!
      post = Post.create(author: "Lydia", title: "traffic", body: "traffic is bad in Boston", date: "2014-03-24", user_id: 4, interest_group_id: 4)
      lydia.posts = [post]
      expect(lydia.posts).to include(post)
    end

    it 'should have many comments' do
      lydia = User.new(valid_attrs)
      lydia.save!
      comment = Comment.create(body: "i'm hungry", user_id: 4, post_id: 4)
      lydia.comments = [comment]
      expect(lydia.comments).to include(comment)
    end
  end
end
