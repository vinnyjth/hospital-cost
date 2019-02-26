class HospitalLineItemsController < ApplicationController
  before_action :set_hospital_line_item, only: [:show, :update, :destroy]

  # GET /hospital_line_items
  def index
    @hospital_line_items = HospitalLineItem.all

    render json: @hospital_line_items
  end

  # GET /hospital_line_items/1
  def show
    render json: @hospital_line_item
  end

  # POST /hospital_line_items
  def create
    @hospital_line_item = HospitalLineItem.new(hospital_line_item_params)

    if @hospital_line_item.save
      render json: @hospital_line_item, status: :created, location: @hospital_line_item
    else
      render json: @hospital_line_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospital_line_items/1
  def update
    if @hospital_line_item.update(hospital_line_item_params)
      render json: @hospital_line_item
    else
      render json: @hospital_line_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospital_line_items/1
  def destroy
    @hospital_line_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_line_item
      @hospital_line_item = HospitalLineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hospital_line_item_params
      params.fetch(:hospital_line_item, {})
    end
end
