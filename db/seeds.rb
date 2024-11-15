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

# Create 4 teams
teams = 4.times.map do
  Team.find_or_create_by!(name: Faker::Sports::Football.team)
end

# Create players for each team
teams.each do |team|
  # Create 1 goalkeeper
  Player.find_or_create_by!(name: Faker::Name.name, 
    skill_level: rand(5..10),
    position: 'Goalkeeper',
    team: team)

  # Create 4 defenders
  4.times do
    Player.find_or_create_by!(name: Faker::Name.name, 
      skill_level: rand(5..10),
      position: 'Defender',
      team: team)
  end

  # Create 3 midfielders
  3.times do
    Player.find_or_create_by!(name: Faker::Name.name, 
      skill_level: rand(5..10),
      position: 'Midfielder',
      team: team)
  end

  # Create 3 forwards
  3.times do
    Player.find_or_create_by!(name: Faker::Name.name, 
      skill_level: rand(5..10),
      position: 'Forward',
      team: team)
  end
end
