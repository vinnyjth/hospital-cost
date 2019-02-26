class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :update, :destroy]

  # GET /hospitals
  def index
    @hospitals = Hospital.all

    render json: @hospitals
  end

  # GET /hospitals/1
  def show
    render json: @hospital
  end

  # POST /hospitals
  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      render json: @hospital, status: :created, location: @hospital
    else
      render json: @hospital.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospitals/1
  def update
    if @hospital.update(hospital_params)
      render json: @hospital
    else
      render json: @hospital.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospitals/1
  def destroy
    @hospital.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hospital_params
      params.fetch(:hospital, {})
    end
end
