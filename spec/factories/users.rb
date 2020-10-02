FactoryBot.define do
  factory :user do
    nickname              {"kappa"}
    email                 {"kappa@com"}
    password              {"123qwe"}
    password_confirmation {password}
    last_name             {"かっぱ"}
    first_name            {"太郎"}
    last_name_kana        {"カッパ"}
    first_name_kana       {"タロウ"}
  end
end