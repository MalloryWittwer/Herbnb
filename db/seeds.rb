require "open-uri"

puts "Destroying all Users... 💣"
User.destroy_all

users_list = [
  {
    user_name: "Marcel Bower",
    address: "Av. de la Rapille 2, 1008 Prilly",
    email: "mbower@gmail.com",
    password: "abcdef"
  },
  {
    user_name: "Jane Tarzan",
    address: "Chem. du Viaduc 14, 1008 Prilly",
    email: "janetarzan@hotmail.com",
    password: "abcdef"
  },
  {
    user_name: "Albert Miller",
    address: "Rue de Lausanne 52, 1020 Renens",
    email: "albert.miller@hotmail.fr",
    password: "abcdef"
  },
  {
    user_name: "Robert Grass",
    address: "Chem. du Bois-de-Vaux 20, 1007 Lausanne",
    email: "rgrass.isnice@gmail.com",
    password: "abcdef"
  },
  {
    user_name: "Jude Liang",
    address: "Av. du Rond-Point 1, 1006 Lausanne",
    email: "jliangever@hotmail.com",
    password: "abcdef"
  },
  {
    user_name: "Arnold Orbach",
    address: "Rue des Côtes-de-Montbenon 14, 1003 Lausanne",
    email: "arnold.orbach@gmail.com",
    password: "abcdef"
  }
]

puts "Creating a seed of #{users_list.size} fake Users... 🌱"

users_list.each_with_index do |user, i|
  User.create!(user)
  puts "> Created User ##{i + 1}"
end

puts "Users table now contains #{User.count} users."

puts "Destroying all Mowers... 💣"
Mower.destroy_all

mowers_data = [
  {
    title: "Great Lawn Mower",
    description: "This Lawn Mower is super efficient. It can mown your green in under 10 minutes!",
    price_per_day: (50..100).to_a.sample.to_f
  },
  {
    title: "Luxury Lawn Mower",
    description: "This Lawn Mower is coated in gold. It belonged to King Henri IV.",
    price_per_day: (50..100).to_a.sample.to_f
  },
  {
    title: "Fabulous Lawn Mower",
    description: "Chuck Norris would choose this lawn Mower. It is the best lawn mower in town. Good deal! Good deal!",
    price_per_day: (50..100).to_a.sample.to_f
  },
  {
    title: "So so Lawn Mower",
    description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
    price_per_day: (50..100).to_a.sample.to_f
  },
  {
    title: "So so Lawn Mower",
    description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
    price_per_day: (50..100).to_a.sample.to_f
  },
  {
    title: "So so Lawn Mower",
    description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!",
    price_per_day: (50..100).to_a.sample.to_f
  }
]

puts "Creating a seed of #{mowers_data.size} fake Mowers... 🌱"

seed_image_urls = [
  "https://media.gerbeaud.net/2020/02/640/tondeuse-electrique-tractee-viking.jpg",
  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mower-1568302588.jpg",
  "https://www.deere.com/assets/images/region-4/products/mowers/lawn-tractors/x300-series-block-r4g074029-1024x576.jpg",
].cycle.take(mowers_data.size)

mowers_data.each_with_index do |mower_params, i|
  mower = Mower.new(mower_params)
  mower.user = User.all.sample  # Associate mower to a user randomly

  mower.photo.attach(
    io: URI.open(seed_image_urls[i]),
    filename: "mower_seed_#{i}.png",
    content_type: 'image/png'
  )

  if mower.save
    puts "> Created Mower ##{i + 1}"
  else
    puts "Error while saving Mower ##{i + 1}.."
  end
end

puts "Mowers table now contains #{Mower.count} mowers."

puts "Seeding finished 🏁. Happy Lawning!"
