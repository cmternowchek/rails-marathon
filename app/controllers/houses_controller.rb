class HousesController < ApplicationController
  def new
    @house = House.new
  end

  def create
    @house = House.new(name: params[:house][:name], author: params[:house][:author], source: params[:house][:source], motto: params[:house][:motto])
    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to house_path(@house)
    else
      flash[:notice] = @house.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @houses = House.all
    @members = Member.all
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

end
