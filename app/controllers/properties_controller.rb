class PropertiesController < ApplicationController
  def index
    Rails.logger.info params
    render json: Property.index(params[:query])
  end
end
