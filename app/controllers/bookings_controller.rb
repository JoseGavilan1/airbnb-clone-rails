class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property, only: [:create]

  def index
    @bookings = current_user.bookings.order(start_date: :desc)
  end

  def create
    @booking = @property.bookings.new(booking_params)
    @booking.user = current_user

    dias = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = dias * @property.price

    if @booking.save
      redirect_to @property, notice: "¡Tu reserva fue confirmada con éxito!"
    else
      redirect_to @property, alert: "Revisa las fechas, hubo un error."
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def booking_params
    params.expect(booking: [ :start_date, :end_date ])
  end
end