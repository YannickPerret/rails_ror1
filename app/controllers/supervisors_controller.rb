class SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]

  def index
    @supervisors = Supervisor.all
  end

  def show
  end

  def new
    @supervisor = Supervisor.new
  end

  def edit
  end

  def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
      redirect_to @supervisor, notice: 'Supervisor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @supervisor.update(supervisor_params)
      redirect_to @supervisor, notice: 'Supervisor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supervisor.destroy
    redirect_to supervisors_url, notice: 'Supervisor was successfully destroyed.'
  end

  private
  def set_supervisor
    @supervisor = Supervisor.find(params[:id])
  end

  def supervisor_params
    params.require(:supervisor).permit(:lastname, :firstname, :email, :password_digest, :address, :phone, :npa, :city, :country)
  end
end
