require 'spec_helper'

describe TimeSlot do

  before(:all) do
    @user = User.create(firstname: 'tan',
                        lastname: 'tam',
                        email: 'tan@tam.tom',
                        password: 'sigh')
    
    @time_slot = @user.time_slots.create(start_time: 3.days.ago,
                                         end_time: DateTime.current,
                                         time_type: "sit")
  end

  after(:all) do
    User.destroy_all
    TimeSlot.destroy_all
  end
  
  it { should belong_to(:user) }
  
  it { should respond_to(:user) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:time_type) }

  # lookup zip based on state/address?

  it { should allow_mass_assignment_of(:start_time) }
  it { should allow_mass_assignment_of(:end_time) }
  it { should allow_mass_assignment_of(:time_type) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:time_type) }

  describe "validates that there is no overlap" do
    it 'when start and end time are totally contained in a previous slot' do
      @bad_time_slot = @user.time_slots.create(start_time: 2.days.ago,
                                               end_time: 1.day.ago,
                                               time_type: "sit")
      puts "HEY!!! \n\n"
      puts @bad_time_slot.errors.inspect
      expect(@bad_time_slot).to_not be_valid
    end
  end
  
end
