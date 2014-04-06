# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  #valid
  factory :vasia, class: Patient  do
    name { "Vasya" }
    skype { "vasia" }
    tel {"06611111111"}
    age {18}
    gender {"М"}
  end

  #not valid
  factory :vasia_error1, class: Patient  do
    name { "" }
    skype { "" }
    tel {""}
    age {}
    gender {""}
  end

  factory :vasia_error2, class: Patient  do
    name { "Vasya" }
    skype { "vasia" }
    tel {""}
    age {18}
    gender {"М"}
  end

  factory :vasia_error3, class: Patient  do
    name { "Vasya" }
    skype { "vasia" }
    tel {"123"}
    age {1}
    gender {"m"}
  end

  factory :vasia_error4, class: Patient  do
    name { "Vasya" }
    skype { "vasia" }
  end

  factory :vasia_empty, class: Patient  do

  end

end