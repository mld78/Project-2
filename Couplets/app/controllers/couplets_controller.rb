class CoupletsController < ApplicationController
  def index
    @couplets = Couplet.all
  end

  def new
    @couplet = Couplet.new
  end

  def create
    @couplet = Couplet.create(couplet_params)

    if @couplet.save
      redirect_to couplets_path
    else
      render :new
    end
  end

  def show
   @couplet = Couplet.find(params[:id])
 end

 def edit
   @couplet = Couplet.find(params[:id])
 end

 def update
 end

  private

  def couplet_params
    params.require(:couplet).permit(:image, :title, :first_line, :last_line)
  end
end
