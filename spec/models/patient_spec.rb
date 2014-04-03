require 'spec_helper'

describe Patient do

  it "has a valid factory" do
    FactoryGirl.build(:patient).should be_valid
  end

  it { should have_many(:meetings).with_foreign_key('patient_id') }

end