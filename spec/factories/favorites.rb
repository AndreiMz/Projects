FactoryBot.define do
  factory :favorite do
    id_user { create(:user).id }
    id_channel { create(:channel).id }
  end
end
