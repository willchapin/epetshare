require 'spec_helper'

describe TimeSlot do

  before(:all) do
    @user = User.create(firstname: 'tan',
                        lastname: 'tam',
                        email: 'tan@tam.tom',
                        password: 'sigh')    
    @pet = Pet.create(name: 'bubba the cloud',
                      user: @user,
                      species: 'dog')
  end
  
  it { should belong_to(:user) }
  
  it { should respond_to(:user) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:time_type) }

  # lookup zip based on state/address?
  
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:start_time) }
  it { should allow_mass_assignment_of(:end_time) }
  it { should allow_mass_assignment_of(:time_type) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:time_type) }

  it 'validates there is no time_slot overlap' do
  end

  
end
