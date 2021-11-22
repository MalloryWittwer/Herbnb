puts "Destroying all Mowers... 💣"
Mower.destroy_all

puts "Creating a seed of 6 fake Mowers... 🌱"
[
  {
    title: "Great Lawn Mower",
    description: "This Lawn Mower is super efficient. It can mown your green in under 10 minutes!"
  },
  {
    title: "Luxury Lawn Mower",
    description: "This Lawn Mower is coated in gold. It belonged to King Henri IV."
  },
  {
    title: "Fabulous Lawn Mower",
    description: "Chuck Norris would choose this lawn Mower. It is the best lawn mower in town. Good deal! Good deal!"
  },
  {
    title: "So so Lawn Mower",
    description: "This Lawn Mower is both light and efficient. It only weighs 12.3 kg!"
  },
].each_with_index do |mower_params, i|
  Mower.create(mower_params)
  if Mower.save
    puts "> Created Mower ##{i + 1}"
  else
    puts "BIP BIP! Error while saving Mower ##{i + 1}.."
  end
end

puts "Seeding ended. Mowers table now contains #{Mower.count} mowers. Happy Lawning!"
