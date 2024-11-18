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

  def buy_players
    @team = Team.find(params[:id])
    if params[:team] && params[:team][:player_ids]
      @team.player_ids = (@team.player_ids + params[:team][:player_ids]).uniq
    else
      redirect_to @team, alert: 'Nenhum jogador selecionado.' and return
    end

    if @team.save
      redirect_to @team, notice: 'Jogadores atualizados com sucesso.'
    else
      render :show, alert: 'Erro ao atualizar jogadores.'
    end
  end

  def sell_players
    @team = Team.find(params[:id])
    player_ids = params[:team] ? params[:team][:player_ids] : nil

    if player_ids.present?
      player_ids.each do |player_id|
        player = Player.find(player_id)
        random_team = Team.where.not(id: @team.id).sample
        player.update(team: random_team)
      end
      redirect_to @team, notice: 'Jogadores vendidos com sucesso.'
    else
      redirect_to @team, alert: 'Nenhum jogador selecionado.'
    end
  end

  def delete
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
