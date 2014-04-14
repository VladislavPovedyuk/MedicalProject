# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  #valid
  factory :meeting1, class: Meeting  do
    patient_id 1
    doctor_id 1
  end

  #not valid
  factory :meeting2, class: Meeting  do
    patient_id ''
    doctor_id ''
  end

  factory :meeting3, class: Meeting  do
    patient_id 1
    doctor_id ''
  end

  factory :meeting4, class: Meeting  do
    patient_id ''
    doctor_id 1
  end


end