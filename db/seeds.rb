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
    address: "Rue de Lausanne 52, 1020 Renens",
    email: "mbower@gmail.com",
    password: "abcdef"
  },
  {
    user_name: "Jane Tarzan",
    address: "Chem. du Bois-de-Vaux 20, 1007 Lausanne",
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
  "Rue du Château 1, 1110 Morges",
  "Le, Pré-Neuf, 1170 Aubonne",
  "Route d`Allaman 120, 1170 Aubonne",
  "chemin du Boiron 2, 1131 Tolochenaz",
  "Chem. des Quatre-Vents 1, 1166 Perroy",
  "Rte du Signal, 1172 Bougy-Villars",
  "Chem. de Plan 92, 1170 Aubonne",
  "Chantre-aux-Daims 1, 1143 Apples",
  "Rte de la Venoge 1, 1123 Aclens",
  "Les Jardins du Château de Vullierens, 1115 Vullierens",
  "Chem. des Epinettes 1, 1032 Romanel-sur-Lausanne",
  "Rte de Neuchâtel 10, 1032 Romanel-sur-Lausanne",
  "Rte de Bottens 1, 1053 Bretigny-sur-Morrens",
  "Chem. de la Forêt, 1037 Bioley-Orjulaz",
  "Général Guisan 1, 1058 Villars-Tiercelin",
  "Rue du Théâtre 12, 1083 Mézières",
  "Chem. des grottes 2, 1083 Mézières",
  "Chem. du Zoo 1, 1077 Servion",
  "Rte de Bossonnens 2B, 1607 Palézieux",
  "57, La Veveyse, Rte d'Oron, 1615 Bossonnens",
  "Chem. des Moines 8, 1095 Lutry",
  "Chem. de la Culturaz 21, 1095 Lutry",
  "Av. de la Tour Haldimand, 1006 Lausanne",
  "Av. de Rhodanie 23, 1007 Lausanne",
  "Av. du Grey 43, 1018 Lausanne",
  "Rte de Lavaux 21, 1802 Corseaux",
  "Pl. de la Gare 3, 1807 Blonay",
  "Quai des Fleurs 9, 1820 Montreux",
  "Chem. de la Glacière 9, 1824 Caux",
  "Quai Alfred Chatelanat 10, 1820 Veytaux",
  "Pré-neuf ZI D 107 Centre commercial Rocville, 1844 Villeneuve",
  "Agence Petzl Suisse, Rte de Granges 9, 1607 Palézieux",
  "Chem. de l'Usine 16, 1040 Echallens",
  "Le Château 1, 1315 La Sarraz",
  "Rue de la Tournelle 48, 1350 Orbe",
  "Rte de Cheseaux 1, 1400 Yverdon-les-Bains",
  "Rue du Moulin 1, 1424 Champagne",
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
