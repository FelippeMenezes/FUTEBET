class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Time criado com sucesso.'
    else
      render :new
    end
  end

  def update
  end

  def delete
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
