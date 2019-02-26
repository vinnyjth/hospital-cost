class ScrapersController < ApplicationController
  before_action :set_scraper, only: [:show, :update, :destroy]

  # GET /scrapers
  def index
    @scrapers = Scraper.all

    render json: @scrapers
  end

  # GET /scrapers/1
  def show
    render json: @scraper
  end

  # POST /scrapers
  def create
    @scraper = Scraper.new(scraper_params)

    if @scraper.save
      render json: @scraper, status: :created, location: @scraper
    else
      render json: @scraper.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scrapers/1
  def update
    if @scraper.update(scraper_params)
      render json: @scraper
    else
      render json: @scraper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scrapers/1
  def destroy
    @scraper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraper
      @scraper = Scraper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scraper_params
      params.fetch(:scraper, {})
    end
end
