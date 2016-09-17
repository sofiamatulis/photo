class PhotographersController < ApplicationController

  before_action      :find_user
skip_before_action :find_user, only: [:index, :show, :edit, :update, :destroy]

def index
   @photographers = Photographer.all

  if params[:search]
 @photographers = Photographer.search(params[:search]).order("created_at DESC")
else
 @photographer = Photographer.all.order('created_at DESC')
end

end

def show
  @Photographer = Photographer.find(params[:id])
end

def new
  @photographer = Photographer.new
end

def edit
  @photographer = Photographer.find(params[:id])
end

def create
  @photographer = Photographer.new(photographer_params)
  @photographer.owner_id = params[:user_id]
  if @photographer.save
    redirect_to [@user, @photographer]
  else
    render :new
  end
end

def update
  @photographer = Photographer.find(params[:id])
  if @photographer.update_attributes(photographer_params)
    redirect_to photographer_url(@photographer), :notice => 'Photographer created with success'
  else
    render :edit
  end
end

def destroy
  @photographer= Photographer.find(params[:id])
  owner = @photographer.owner_id
  @photographer = @photographer.reservations
  @photographer.destroy
  @photographer.destroy
  redirect_to user_path(owner)
end

def owner_show_page
  @photographer = Photographer.find_by(@user)

end

def default_photo
  'image.jpg'
end


private
def photographer_params
  params.require(:photographer).permit(:name, :address, :phone, :website)
end

def find_user
  @user = User.find(params[:user_id])
end

end
