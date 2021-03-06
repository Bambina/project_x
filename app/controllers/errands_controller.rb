class ErrandsController < ApplicationController
  before_action :check_authorized #=> except private methods
  before_action :set_errand, only: %i(edit show update destroy)

  def index
    @errands = current_user.errands
  end

  def new
    @errand = current_user.errands.new
  end

  def create
    @errand = current_user.errands.new(errand_params)
    if @errand.save
    else
      render json: { errand: @errand.errors }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    errand = Errand.find(params[:id])
    @task = errand.tasks.new
    @shared_url = "#{root_url}shared_errands/#{errand.shared_hash}"
  end

  def update
    if @errand.update(errand_params)
    else
      render json: { errand: @errand.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @errand.destroy
  end

  private

  def set_errand
    @errand = current_user.errands.find(params[:id])
  end

  def errand_params
    params.require(:errand).permit(:name)
  end
end
