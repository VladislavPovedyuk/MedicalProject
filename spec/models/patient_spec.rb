require 'spec_helper'

describe Patient do

  #valid
  it "has a valid factory" do
    FactoryGirl.build(:vasia).should be_valid
  end

  #not valid
  it "has a not valid factory" do
    FactoryGirl.build(:vasia_error1).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:vasia_error2).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:vasia_error3).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:vasia_error4).should_not be_valid
  end

  it "has a not valid factory" do
    FactoryGirl.build(:vasia_empty).should_not be_valid
  end

  it { should have_many(:meetings).with_foreign_key('patient_id') }

end