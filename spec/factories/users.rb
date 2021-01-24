FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = "abc123"
    password {password}
    password_confirmation {password}

    last_name {"全角"}
    first_name {"全角"}
    last_name_kana {"ゼンカク"}
    first_name_kana {"ゼンカク"}

    birthday {Faker::Date.birthday}
  end
end