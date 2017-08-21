class Spree::Api::V1::CountiesController < Spree::Api::BaseController
  skip_before_action :authenticate_user

  def index
    @counties = scope.ransack(params[:q]).result.includes(:state)

    if params[:page] || params[:per_page]
      @counties = @counties.page(params[:page]).per(params[:per_page])
    end

    county = @counties.last
    if stale?(county)
      respond_with(@counties)
    end
  end

  def show
    @county = scope.find(params[:id])
    respond_with(@county)
  end

  protected

  def scope
    if params[:state_id]
      @state = Spree::State.find(params[:state_id])
      return @state.counties.order('name ASC')
    else
      return Spree::County.order('name ASC')
    end
  end
end
