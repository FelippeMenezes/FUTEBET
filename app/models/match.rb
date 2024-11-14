class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  def simulate
    home_score = rand(0..5)
    away_score = rand(0..5)
    self.home_score = home_score
    self.away_score = away_score
    save
  end
end
