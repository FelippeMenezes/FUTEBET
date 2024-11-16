class Team < ApplicationRecord
  belongs_to :user , optional: true
  has_many :players
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'

  def total_points
    points = 0
    home_matches.each do |match|
      points += 3 if match.home_score > match.away_score
      points += 1 if match.home_score == match.away_score
    end
    away_matches.each do |match|
      points += 3 if match.away_score > match.home_score
      points += 1 if match.away_score == match.home_score
    end
    points
  end
end
