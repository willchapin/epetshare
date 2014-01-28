require 'spec_helper'

describe Pet do
  before(:all) do
    @user = User.create(firstname: 'tan',
                        lastname: 'tam',
                        email: 'tan@tam.tom',
                        password: 'DOH')    
    @pet = Pet.create(name: 'bubba the cloud',
                      user: @user,
                      species: 'dog')
  end

  after(:all) do
    User.destroy_all
    Pet.destroy_all
  end
  
  it { should respond_to(:name) }
  it { should respond_to(:user) }
  it { should respond_to(:species) }
  it { should respond_to(:food_preferences) }
  it { should respond_to(:is_social) }
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:species) }
  it { should allow_mass_assignment_of(:food_preferences) }
  it { should allow_mass_assignment_of(:is_social) }  

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:species) }

  it "validates uniqueness of pet" do
    badpet = Pet.new(name: 'bubba the cloud',
                     user: @user,
                     species: 'dog')
    
    expect(badpet).to_not be_valid
  end

  it { should ensure_length_of(:name).is_at_most(30) }
  it { should belong_to(:user) }

  it { should ensure_inclusion_of(:species).in_array(%w(cat dog)) }
end
