require 'spec_helper'

describe Location do
  
  it { should respond_to(:user) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }

  # lookup zip based on state/address?
  
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:address) }
  it { should allow_mass_assignment_of(:city) }
  it { should allow_mass_assignment_of(:state) }
  it { should allow_mass_assignment_of(:zip) }  

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }

  it { should ensure_length_of(:address).is_at_most(50) }
  it { should ensure_length_of(:city).is_at_most(40) }
  it { should ensure_length_of(:state).is_at_most(12) }
  it { should ensure_length_of(:zip).is_equal_to(5) }
  
  it { should belong_to(:user) }
  
end
