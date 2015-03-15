class PantsController < ApplicationController
  before_action :set_pant, only:[:show, :edit, :update]

  def index
    @pants = Pant.all
  end

  def show
  end

  def new
    @pant = Pant.new
  end

  def create
    pant = Pant.new(pant_params)
    if pant.save
      flash[:notice] = 'You bought some new pants!'
      redirect_to pants_path
    else
      @pant = pant
      render :new
    end
  end

  def edit
  end

  def update
    if @pant.update(pant_params)
      flash[:notice] = 'You updated your pants'
      redirect_to pants_path
    else
      render :edit
    end
  end

  def destroy
    pant = Pant.find(params[:id])
    pant.destroy
    flash[:notice] = 'those pants are burnt down'
    redirect_to pants_path
  end

  private

  def pant_params
  params.require(:pant).permit(:description, :user_id)
  end

  def set_pant
    @pant = Pant.find(params[:id])
  end

end
