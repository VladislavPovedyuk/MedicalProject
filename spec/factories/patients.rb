# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    name { "Vasya" }
    skype { "vasia" }
    tel {"06611111111"}
    age {18}
    gender {"М"}
  end


end