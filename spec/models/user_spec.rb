require 'spec_helper'

describe User do

  before(:all) { User.create(firstname: 'tan',
                             lastname: 'tam',
                             email: 'tan@tam.tom',
                             password: 'meep') }

  after(:all) { User.destroy_all }

  it { should respond_to(:firstname) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }
  it { should respond_to(:paw_points) }

  it { should allow_mass_assignment_of(:firstname) }
  it { should allow_mass_assignment_of(:lastname) }
  it { should allow_mass_assignment_of(:email) }  
  it { should allow_mass_assignment_of(:password) }
  
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:email) }

  it { should validate_uniqueness_of(:email)}

  it { should allow_value('valid_email@internet.com').for(:email) }
  it { should_not allow_value('I am not an email address').for(:email) }

  it { should ensure_length_of(:firstname).is_at_most(15) }
  it { should ensure_length_of(:lastname).is_at_most(15) }
  
  it { should have_one(:location) }
  it { should have_many(:pets) }
  it { should have_many(:time_slots) }
  it { should have_many(:sent_messages) }
  it { should have_many(:received_messages) }
  
  it "downcases its email before saving" do
    caps_user = User.create(firstname: 'foo',
                lastname: 'bar',
                email: 'FoObAr@FAKE.com',
                password: 'meeeep')
    expect(caps_user.email).to eq("foobar@fake.com")
  end
end