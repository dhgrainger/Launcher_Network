require 'spec_helper'

describe InterestGroup do

  let(:valid_attrs) { { group_name: 'Good Christians', creator: 'Lydia'} }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end
    end

    it 'requires a name' do
      interest_group = InterestGroup.new
      interest_group.valid?
      expect(interest_group.errors[:group_name]).to include "can't be blank"
    end

    it 'requires a creator' do
      interest_group = InterestGroup.new
      interest_group.valid?
      expect(interest_group.errors[:creator]).to include "can't be blank"
    end
  end

  describe 'associations' do
    it 'should have a creator' do

      creator_attributes = {
          first_name: "doug",
          last_name: "grainger",
          email_address: "ballin@badass.com",
          launcher_or_ee: "launcher"
        }

      creator = User.create(creator_attributes)

      group_attributes = {
        group_name: "Excuses",
        creator: creator
      }

      group = InterestGroup.create(group_attributes)

      expect(group.creator).to eq creator
    end

    it 'should have many posts' do
      creator_attributes = {
                first_name: "doug",
                last_name: "grainger",
                email_address: "ballin@badass.com",
                launcher_or_ee: "launcher"
              }

      creator = User.create(creator_attributes)

      group_attributes = {
              group_name: "Excuses",
              creator: creator
            }

      group = InterestGroup.create(group_attributes)

      post_attributes = {
        author: "Doug Grainger",
        title: "Patriots",
        body: "the patriots will win this year",
        date: "2014-03-24",
        user_id: 1,
        interest_group_id: 1,
      }

      post = Post.create!(post_attributes)
      group.posts = [ post ]
      expect(group.posts).to include(post)
    end
  end
end


