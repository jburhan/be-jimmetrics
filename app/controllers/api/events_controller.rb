class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_filter :set_access_control_headers

  def set_access_control_headers
    #allows requests from any origins
    headers['Access-Control-Allow-Origin'] = '*'
    #allows post get and options methods
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #allows the content-type header to declare the type of the data being sent
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def preflight
   head 200
  end

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application
      @event = current_user.registered_applications.events.new(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: {errors: @event.errors}, status: :unprocessable_entity
      end
    else
      render json: "Application is not registered", status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.permit(:name)
  end
end
