FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person-#{n}@gmail.com" }
    sequence(:name) {|n| "person-#{n}" }
    password "secret"
    password_confirmation "secret"
    source Source.where(:name => "test source").first_or_create
    role "normal"

    factory :admin do
      role "admin"
    end
  end
end