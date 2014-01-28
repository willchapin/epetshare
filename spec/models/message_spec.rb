require 'spec_helper'

describe Message do

  let(:user) { User.create(firstname: 'tan',
                           lastname: 'tam',
                           email: 'tan@tam.tom',
                           password: 'grumble') }
  
  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:sender) }  
  it { should respond_to(:recipient) }

  it { should allow_mass_assignment_of(:content) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:recipient) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:sender) }
  it { should validate_presence_of(:recipient) }

  it "checks that the sender is not the recipient" do
    message = user.sent_messages.create({ content: "I'm bad",
                                          title: "So bad",
                                          recipient: user })
    expect(message).to_not be_valid
  end

  it { should ensure_length_of(:title).is_at_most(100) }
  it { should ensure_length_of(:content).is_at_most(2500) }

  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }
  
end
