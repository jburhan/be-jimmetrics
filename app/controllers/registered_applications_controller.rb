class RegisteredApplicationsController < ApplicationController
  def index
    @applications = RegisteredApplication.all
  end

  def show
    @application = RegisteredApplication.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def new
    @application = RegisteredApplication.new
  end

  def create
    @application = current_user.registered_applications.new(app_params)
    if @application.save
      flash[:success] = "Application registered"
      redirect_to registered_applications_path
    else
      flash.now[:warning] = "Please enter a valid name and URL"
      render 'new'
    end
  end

  def edit
    @application = RegisteredApplication.find(params[:id])
  end

  def update
    @application = RegisteredApplication.find(params[:id])

    if @application.update_attributes(app_params)
      flash[:notice] = "Application was updated"
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "Please try again."
      render :edit
    end

  end

  def destroy
    @application = RegisteredApplication.find(params[:id])
    if @application.destroy
      flash[:success] = "Application removed"
      redirect_to registered_applications_path
    else
      flash[:warning] = "Please try again"
    end
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
