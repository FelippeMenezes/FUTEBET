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

# Create 4 teams with 11 players (1 Goalkeeper, 4 Defenders, 3 Midfielders, 3 Forwards)
4.times do |team_index|
  team = Team.create!(name: Faker::Sports::Football.team)

  # Create 1 Goalkeeper
  Player.create!(name: Faker::Sports::Football.player, position: 'Goalkeeper', team: team, skill_level: rand(5..10))

  # Create 4 Defenders
  4.times do
    Player.create!(name: Faker::Sports::Football.player, position: 'Defender', team: team, skill_level: rand(5..10))
  end

  # Create 3 Midfielders
  3.times do
    Player.create!(name: Faker::Sports::Football.player, position: 'Midfielder', team: team, skill_level: rand(5..10))
  end

  # Create 3 Forwards
  3.times do
    Player.create!(name: Faker::Sports::Football.player, position: 'Forward', team: team, skill_level: rand(5..10))
  end
end
