class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: %i[ edit update destroy ]

  # GET /properties or /properties.json
def index
    if params[:location].present?
      @properties = Property.where("location ILIKE ?", "%#{params[:location]}%")
    else
      @properties = Property.all
    end
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.user = current_user

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy!

    respond_to do |format|
      format.html { redirect_to properties_path, notice: "Property was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def mis_propiedades
    @properties = current_user.properties.order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :description, :price, :location, :photo, :latitude, :longitude)
    end

    def authorize_user!
      unless @property.user == current_user
        redirect_to properties_path, alert: "¡Alto ahí! No tienes permiso para modificar esta propiedad."
      end
    end
end
