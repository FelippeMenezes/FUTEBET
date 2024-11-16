# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Cria alguns times primeiro
teams = []
8.times do |i|
  teams << Team.create!(name: Faker::Creature::Animal.name)
end

# Cria jogadores e associa-os a um time
positions = {
  "Goleiro" => 20,
  "Defensor" => 60,
  "Meio-Campista" => 60,
  "Atacante" => 60
}

positions.each do |position, count|
  count.times do
    Player.create!(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      position: position,
      skill_level: rand(6..10),
      team: teams.sample # Associa o jogador a um time aleatório
    )
  end
end

# Cria algumas temporadas
3.times do |i|
  Season.create!(name: "Season #{i + 1}")
end