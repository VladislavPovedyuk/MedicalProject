require 'spec_helper'

describe Doctor do

  #valid
  it "has a valid factory" do
    FactoryGirl.build(:richards).should be_valid
  end

  #not valid
  it "has a not valid factory" do
    FactoryGirl.build(:doctor_not_valid).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:doctor_not_valid2).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:doctor_not_valid3).should be_valid
  end

  it { should have_many(:meetings).with_foreign_key('doctor_id') }

end