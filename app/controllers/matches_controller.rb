class MatchesController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def create
    @home_team = Team.find(params[:home_team_id])
    @away_team = Team.find(params[:away_team_id])
    @match = Match.new(home_team: @home_team, away_team: @away_team)

    if @match.save
      redirect_to match_path(@match)
    else
      render :index
    end
  end

  def update
  end

  def delete
  end
end
