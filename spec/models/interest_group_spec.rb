require 'spec_helper'

describe InterestGroup do
  let(:valid_attrs) { { group_name: 'Good Christians'} }

  describe 'validations' do
    context "when given valid attributes" do
      interest_group = InterestGroup.new(valid_attrs)
      expect(interest_group).to be_valid
    end
  end

end



  # it { should validate_presence_of :group_name }
  # it { should validate_presence_of :creator }

  # it { should have_many :user_groups }
  # it { should have_many :posts }
  # it { should have_many :users, through: :user_groups, source: :user }
