Spree::Admin::ZonesController.class_eval do
  before_action :load_counties, except: [:index]

protected

  def load_counties
    @counties = Spree::County.order(:name)
  end

end