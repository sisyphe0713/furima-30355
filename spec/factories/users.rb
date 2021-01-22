FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    # password = Faker::Internet.password(min_length: 6)
    password = "abC123" #Fakerで英数字"混合"の出力があるとよいのだが
    password {password}
    password_confirmation {password}

    # last_name {Faker::Name.last_name}
    # first_name {Faker::Name.first_name}
    # last_name_kana {Faker::Name.last_name}
    # first_name_kana {Faker::Name.first_name}

    last_name {"全角"} #Fakerで全角の出力があるとよいのだが
    first_name {"全角"} #Fakerで全角の出力があるとよいのだが
    last_name_kana {"ぜんかく"} #Fakerで全角の出力があるとよいのだが
    first_name_kana {"ぜんかく"} #Fakerで全角の出力があるとよいのだが

    birthday {Faker::Date.birthday}
  end
end