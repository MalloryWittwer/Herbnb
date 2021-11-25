require "open-uri"
require 'faker'

user_amount = 10
mowers_amount = user_amount * 2
pictures = []
urls = [
  "https://source.unsplash.com/random/?lawn-mower",
  "https://source.unsplash.com/500x300/?lawn-mower",
  "https://source.unsplash.com/400x200/?lawn-mower",
  "https://source.unsplash.com/300x200/?lawn-mower",
  "https://source.unsplash.com/random/?lawn%20mower",
  "https://source.unsplash.com/500x300/?lawn%20mower",
  "https://source.unsplash.com/400x200/?lawn%20mower",
  "https://source.unsplash.com/300x200/?lawn%20mower"
]

puts "Destroying all Users... 💣"
User.destroy_all

users_list = [
  {
    user_name: "Marcel Bower",
    address: "777 Brockton Avenue, Abington MA 2351",
    email: "mbower@gmail.com",
    password: "abcdef"
  },
  {
    user_name: "Jane Tarzan",
    address: "250 Hartford Avenue, Bellingham MA 2019",
    email: "janetarzan@hotmail.com",
    password: "abcdef"
  }
  # {
  #   user_name: "Albert Miller",
  #   address: "Rue de Lausanne 52, 1020 Renens",
  #   email: "albert.miller@hotmail.fr",
  #   password: "abcdef"
  # },
  # {
  #   user_name: "Robert Grass",
  #   address: "Chem. du Bois-de-Vaux 20, 1007 Lausanne",
  #   email: "rgrass.isnice@gmail.com",
  #   password: "abcdef"
  # },
  # {
  #   user_name: "Jude Liang",
  #   address: "Av. du Rond-Point 1, 1006 Lausanne",
  #   email: "jliangever@hotmail.com",
  #   password: "abcdef"
  # },
  # {
  #   user_name: "Arnold Orbach",
  #   address: "Rue des Côtes-de-Montbenon 14, 1003 Lausanne",
  #   email: "arnold.orbach@gmail.com",
  #   password: "abcdef"
  # }
]

fake_adresses = [
  "777 Brockton Avenue, Abington MA 2351",
  "30 Memorial Drive, Avon MA 2322",
  "250 Hartford Avenue, Bellingham MA 2019",
  "700 Oak Street, Brockton MA 2301",
  "66-4 Parkhurst Rd, Chelmsford MA 1824",
  "591 Memorial Dr, Chicopee MA 1020",
  "55 Brooksby Village Way, Danvers MA 1923",
  "137 Teaticket Hwy, East Falmouth MA 2536",
  "42 Fairhaven Commons Way, Fairhaven MA 2719",
  "374 William S Canning Blvd, Fall River MA 2721",
  "121 Worcester Rd, Framingham MA 1701",
  "677 Timpany Blvd, Gardner MA 1440",
  "337 Russell St, Hadley MA 1035",
  "295 Plymouth Street, Halifax MA 2338",
  "1775 Washington St, Hanover MA 2339",
  "280 Washington Street, Hudson MA 1749",
  "20 Soojian Dr, Leicester MA 1524",
  "11 Jungle Road, Leominster MA 1453",
  "301 Massachusetts Ave, Lunenburg MA 1462",
  "780 Lynnway, Lynn MA 1905",
  "70 Pleasant Valley Street, Methuen MA 1844",
  "830 Curran Memorial Hwy, North Adams MA 1247",
  "1470 S Washington St, North Attleboro MA 2760",
  "506 State Road, North Dartmouth MA 2747",
  "742 Main Street, North Oxford MA 1537",
  "72 Main St, North Reading MA 1864",
  "200 Otis Street, Northborough MA 1532",
  "180 North King Street, Northhampton MA 1060",
  "555 East Main St, Orange MA 1364",
  "555 Hubbard Ave-Suite 12, Pittsfield MA 1201",
  "300 Colony Place, Plymouth MA 2360",
  "301 Falls Blvd, Quincy MA 2169",
  "36 Paramount Drive, Raynham MA 2767",
  "450 Highland Ave, Salem MA 1970",
  "1180 Fall River Avenue, Seekonk MA 2771",
  "1105 Boston Road, Springfield MA 1119",
  "100 Charlton Road, Sturbridge MA 1566",
]

user_amount.times do
  new_user = {
    user_name: Faker::Internet.unique.username,
    address: fake_adresses.sample,
    email: Faker::Internet.email,
    password: "abcdef"
  }
  users_list << new_user
end

puts "Creating a seed of #{users_list.size} fake Users... 🌱"

users_list.each_with_index do |user, i|
  User.create!(user)
  puts "> Created User ##{i + 1}"
end

puts "Users table now contains #{User.count} users."

# puts "Destroying all Mowers... 💣"
# Mower.destroy_all

# mowers_data = [
#   {
#     title: "Great Lawn Mower",
#     description: "This Lawn Mower is super efficient. It can mown your green in under 10 minutes!",
#     price_per_day: (50..100).to_a.sample.to_f
#   },
#   {
#     title: "Luxury Lawn Mower",
#     description: "This Lawn Mower is coated in gold. It belonged to King Henri IV.",
#     price_per_day: (50..100).to_a.sample.to_f
#   },
#   {
#     title: "Fabulous Lawn Mower",
#     description: "Chuck Norris would choose this lawn Mower. It is the best lawn mower in town. Good deal! Good deal!",
#     price_per_day: (50..100).to_a.sample.to_f
#   },
#   {
#     title: "So so Lawn Mower",
#     description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
#     price_per_day: (50..100).to_a.sample.to_f
#   },
#   {
#     title: "So so Lawn Mower",
#     description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
#     price_per_day: (50..100).to_a.sample.to_f
#   },
#   {
#     title: "So so Lawn Mower",
#     description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
#     price_per_day: (50..100).to_a.sample.to_f
#   }
# ]

# puts "Creating a seed of #{mowers_data.size} fake Mowers... 🌱"

# seed_image_urls = [
#   "https://media.gerbeaud.net/2020/02/640/tondeuse-electrique-tractee-viking.jpg",
#   "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mower-1568302588.jpg",
#   "https://www.deere.com/assets/images/region-4/products/mowers/lawn-tractors/x300-series-block-r4g074029-1024x576.jpg",
# ].cycle.take(mowers_data.size)

# mowers_data.each_with_index do |mower_params, i|
#   mower = Mower.new(mower_params)
#   mower.user = User.all.sample  # Associate mower to a user randomly

#   mower.photo.attach(
#     io: URI.open(seed_image_urls[i]),
#     filename: "mower_seed_#{i}.png",
#     content_type: 'image/png'
#   )

  # Andreas

  puts "Creating a seed of #{mowers_amount} fake Mowers... 🌱"
  mowers_amount.times do |i|
    mower_params = {
      title: "#{Faker::Appliance.brand} lawn mower",
      description: Faker::Lorem.paragraph_by_chars(number: 200),
      price_per_day: (5..20).to_a.sample.to_f * 10,
    }
    mower = Mower.new(mower_params)
    mower.user = User.all.sample
    mower.photo.attach(
      io: URI.open(urls.sample),
      filename: "mower_seed#{i}.png",
      content_type: 'image/png'
    )
    if mower.save
      puts "> Creating Mower ##{i + 1}"
    else
      puts "Error while saving Mower ##{i + 1}.."
    end
  end


puts "Mowers table now contains #{Mower.count} mowers."

puts "Seeding finished 🏁. Happy Lawning!"
