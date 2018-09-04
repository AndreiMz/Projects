FactoryBot.define do
  factory :video do
    title { Faker::Name.name }
    url { Faker::Internet.url('youtube.com') }
    channel_id { rand(1..100) }
    youtube_id { Faker::Crypto.md5 }
  end
end
