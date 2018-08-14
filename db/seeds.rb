# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.create(name: 'TheFatRat',
               channel_url: 'https://www.youtube.com/user/ThisIsTheFatRat',
               youtube_id: 'UCa_UMppcMsHIzb5LDx1u9zQ')
Channel.create(name: 'Delain Music Fan',
               channel_url: 'https://www.youtube.com/channel/UCyPAlczqZ0kGcl-QvVmuG3Q',
               youtube_id: 'UCyPAlczqZ0kGcl-QvVmuG3Q')
