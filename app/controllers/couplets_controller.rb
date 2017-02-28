class CoupletsController < ApplicationController
before_action :authenticate_user!
before_action :set_couplet, only: [:show, :edit, :update, :destroy]
before_action :owned_couplet, only: [:edit, :update, :destroy]

  def index
    @couplets = Couplet.all
  end

  def show
   @couplet = Couplet.find(params[:id])
  end

  def new

    @couplet = current_user.couplets.new
  end

   def edit
     @couplet = Couplet.find(params[:id])
   end

  def create

    @couplet = current_user.couplets.create(couplet_params)
    respond_to do |format|
    if @couplet.save
      format.html { redirect_to @couplet, notice: 'Couplet was successfully created.' }

    else
      format.html { render :new }
    end
  end
  end




 def update
   @couplet = Couplet.find(params[:id])
   if @couplet.update_attributes(couplet_params)

      redirect_to couplets_path
    else

      render :edit
    end
 end

 def destroy
  @couplet = Couplet.find(params[:id])
  @couplet.destroy
  redirect_to couplets_path
end

  private

  def set_couplet
      @couplet = Couplet.find(params[:id])
    end

  def couplet_params
    params.require(:couplet).permit(:image, :title, :first_line, :last_line)
  end

  def owned_couplet
    unless current_user == @couplet.user
      
      redirect_to root_path
    end
  end
end
