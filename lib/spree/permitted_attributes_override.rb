module Spree
  module PermittedAttributesOverride

    @@address_attributes = [
        :id, :firstname, :lastname, :first_name, :last_name,
        :address1, :address2, :city, :country_id, :state_id, :county_id,
        :zipcode, :phone, :state_name, :alternative_phone, :company,
        country: [:iso, :name, :iso3, :iso_name],
        state: [:name, :abbr],
        county: [:name]
    ]
  end
end