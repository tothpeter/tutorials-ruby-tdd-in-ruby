class CompetitionsController < ApplicationController

  def show
    
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new competition_params

    if @competition.save
      redirect_to @competition, notice: "Completition created."
    else
      render :new
    end
  end

  private
  def competition_params
    params.permit(:name)
  end
end