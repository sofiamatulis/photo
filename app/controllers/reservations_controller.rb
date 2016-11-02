class ReservationsController < ApplicationController
  before_action do
    @photographer = Photographer.find(params[:photographer_id])
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.photographer = @photographer
    @reservation.user_id = session[:user_id]

    if @reservation.save
      redirect_to [@photographer, @reservation], :notice => 'Reservation created with success'
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to photographer_reservation_path(@photographer, @reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to photographers_path
  end

  def viewall
    @reservations = @photographer.reservations.all
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :photographer_id, :date, :time, :comment)
  end
end
