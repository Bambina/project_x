class SharedErrandsController < ApplicationController
  def show
    @errand = Errand.find_by(shared_hash: params[:shared_hash])

    respond_to do |format|
      format.html { render template: 'errands/show' }
      format.json { render :json => { :errand => @errand, :tasks => @errand.tasks } }
    end
  end
end
