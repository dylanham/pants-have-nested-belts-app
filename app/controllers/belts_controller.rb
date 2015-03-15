class BeltsController < ApplicationController
  before_action :set_belt, only:[:show, :edit, :update]
  before_action :find_and_set_pant

  def index
    @belts = @pant.belts
  end

  def show
  end

  def new
    @belt = @pant.belts.new
  end

  def create
    belt = @pant.belts.new(belt_params)
    if belt.save
      flash[:notice] = 'You got a sweet new belt'
      redirect_to pant_belts_path
    else
      @belt = belt
      render :new
    end
  end

  def edit
  end

  def update
    if @belt.update(belt_params)
      flash[:notice] = "new belt"
      redirect_to pant_belts_path
    else
      render :edit
    end
  end

  def destroy
    belt = Belt.find(params[:id])
    belt.destroy
    flash[:notice] = "your belt is gone!"
    redirect_to pant_belts_path
  end

  private

  def belt_params
    params.require(:belt).permit(:name, :pant_id)
  end

  def set_belt
    @belt = Belt.find(params[:id])
  end

  def find_and_set_pant
    @pant = Pant.find(params[:pant_id])
  end

end
