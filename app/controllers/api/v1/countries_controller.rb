class Api::V1::CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: @countries
  end
end
