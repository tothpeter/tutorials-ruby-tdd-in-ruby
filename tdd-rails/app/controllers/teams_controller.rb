class TeamsController < ApplicationController

  def show
    @team = Team.find params[:id]
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params

    if @team.save
      redirect_to @team, notice: %Q{Created team "#{@team.name}".}
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end