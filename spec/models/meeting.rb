require 'spec_helper'

describe Meeting do

  #valid
  it "has a valid factory" do
    FactoryGirl.build(:meeting1).should be_valid
  end

  #valid
  it "has a valid factory" do
    FactoryGirl.build(:meeting2).should_not be_valid
  end

  it "has a valid factory" do
    FactoryGirl.build(:meeting3).should_not be_valid
  end

  it "has a valid factory" do
    FactoryGirl.build(:meeting4).should_not be_valid
  end


  #it { should validate_presence_of(:doctor) }
  #it { should validate_presence_of(:patient) }

end