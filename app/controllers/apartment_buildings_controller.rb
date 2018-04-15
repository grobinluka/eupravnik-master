class ApartmentBuildingsController < ApplicationController
  before_action :set_apartment_building, only: [:show, :edit, :update, :destroy]

  # GET /apartment_buildings
  # GET /apartment_buildings.json
  def index
    @apartment_buildings = ApartmentBuilding.all
  end

  # GET /apartment_buildings/1
  # GET /apartment_buildings/1.json
  def show
  end

  # GET /apartment_buildings/new
  def new
    @apartment_building = ApartmentBuilding.new
  end

  # GET /apartment_buildings/1/edit
  def edit
  end

  # POST /apartment_buildings
  # POST /apartment_buildings.json
  def create
    @apartment_building = ApartmentBuilding.new(apartment_building_params)

    respond_to do |format|
      if @apartment_building.save
        format.html { redirect_to @apartment_building, notice: 'Apartment building was successfully created.' }
        format.json { render :show, status: :created, location: @apartment_building }
      else
        format.html { render :new }
        format.json { render json: @apartment_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_buildings/1
  # PATCH/PUT /apartment_buildings/1.json
  def update
    respond_to do |format|
      if @apartment_building.update(apartment_building_params)
        format.html { redirect_to @apartment_building, notice: 'Apartment building was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment_building }
      else
        format.html { render :edit }
        format.json { render json: @apartment_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_buildings/1
  # DELETE /apartment_buildings/1.json
  def destroy
    @apartment_building.destroy
    respond_to do |format|
      format.html { redirect_to apartment_buildings_url, notice: 'Apartment building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_building
      @apartment_building = ApartmentBuilding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_building_params
      params.require(:apartment_building).permit(:name, :address)
    end
end
