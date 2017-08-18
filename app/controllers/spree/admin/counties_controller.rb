class Spree::Admin::CountiesController < Spree::Admin::ResourceController
   belongs_to 'spree/state'
  before_action :load_data

  def index
    respond_with(@collection) do |format|
      format.html
      format.js { render :partial => 'counties_list' }
    end
  end

  protected

  def location_after_save
    admin_country_state_counties_url(@country.id, @state.id)
  end

   def new_object_url(options = {})
     new_admin_country_state_county_url(@country.id, @state.id)
   end

   def edit_object_url(object, options = {})
     edit_admin_country_state_county_url(@country.id, object.state_id, object.id)
   end

   def object_url(object = nil, options = {})
     admin_country_state_county_url(@country.id, object.state_id, object.id)
   end

   def collection_url(options = {})
     admin_country_state_county_url(@country.id, @state.id)
   end

  def collection
    model_class.order(:state_id)
  end

  def load_data
    @countries = Spree::Country.order(:name)
    @country = Spree::Country.find(params[:country_id] || Spree::Config[:default_country_id])
    @states = Spree::State.where(country: @country).order(:name)
    if params[:state_id]
      @state = Spree::State.find(params[:state_id])
    else
      @state = @states.first
    end

  end
end
