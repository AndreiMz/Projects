FactoryBot.define do
  factory :channel do
    name { Faker::Name.name }
    channel_url { Faker::Internet.url('youtube.com') }
    youtube_id { Faker::IDNumber.valid }
  end
end
