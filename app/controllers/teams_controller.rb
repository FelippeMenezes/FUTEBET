class TeamsController < ApplicationController
  def index
    @teams = Team.where(user_id: current_user.id)
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Time criado com sucesso.'
    else
      render :new
    end
  end

  def update
  end

  def update_players
    @team = Team.find(params[:id])
    @team.player_ids = params[:team][:player_ids]
    if @team.save
      redirect_to @team, notice: 'Jogadores atualizados com sucesso.'
    else
      render :show, alert: 'Erro ao atualizar jogadores.'
    end
  end

  def delete
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
