class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @property, notice: "¡Gracias por tu reseña!"
    else
      redirect_to @property, alert: "Hubo un error al guardar tu reseña. Asegúrate de poner una calificación y un comentario."
    end
  end

  private

  def review_params
    params.expect(review: [ :rating, :comment ])
  end
end