# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  #valid
  factory :richards, class: Doctor  do
    name "Dr. Richards"
    email "rich@mail.ru"
    password "11111111"
    password_confirmation "11111111"
  end

  factory :doctor_login, class: Doctor  do
    name "Dr. Login"
    email "login@mail.ru"
    password "11111111"
    password_confirmation "11111111"
  end

  #not valid
  factory :doctor_not_valid, class: Doctor  do
    name ""
    email ""
    password ""
    password_confirmation ""
  end

  factory :doctor_not_valid2, class: Doctor  do
    name "123"
    email "123"
    password "123"
    password_confirmation "123"
  end

  factory :doctor_not_valid3, class: Doctor  do
    name "Dr.Dulitl"
    email "dul@gmail.com"
    password " 1d df g23 87"
    password_confirmation " 1d df g23 87"
  end

end