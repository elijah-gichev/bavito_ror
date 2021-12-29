# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([ {
                name: "Elijah",
                password: "1d2c3ab1",
                email: "email@123.com",
                phone: "11111111111"
              },
              {
                name: "Alexa",
                password: "ffffffff",
                email: "emailY@123.com",
                phone: "11111111121"
              }
            ])

Product.create([
              {
                user_id: 1,
                title: "Keanu Reeves",
                description: "Good man",
                image_url: "https://dazedimg-dazedgroup.netdna-ssl.com/900/azure/dazed-prod/1280/4/1284584.jpg",
                points: 1
              },
              {
                user_id: 2,
                title: "Yandex logo",
                description: "Good logo",
                image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Yandex_Browser_logo.svg/2048px-Yandex_Browser_logo.svg.png",
                points: 1
              },
              {
                user_id: 1,
                title: "Mobyte logo",
                description: "Another good logo",
                image_url: "https://sun9-22.userapi.com/impg/i6njkurE1fXyF4XRNapOrs4Hn3Dj0B_jliTEOg/QsaTROK0FZk.jpg?size=604x604&quality=96&sign=9475116d71af61c2f78c4fc191e5441e&type=album",
                points: 1}
            ])
Request.create([
                 creator_id: 1,
                 sender_id: 1,
                 recipient_id: 2,
                 sender_good_id: 1,
                 recipient_good_id: 2,
                 comment: "Good trade!",

  ]
)