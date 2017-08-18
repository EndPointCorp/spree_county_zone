Spree::Zone.class_eval do

  def include?(address)
    return false unless address

    members.any? do |zone_member|
      case zone_member.zoneable_type
        when 'Spree::Country'
          zone_member.zoneable_id == address.country_id
        when 'Spree::State'
          zone_member.zoneable_id == address.state_id
        when 'Spree::County'
          zone_member.zoneable_id == Spree::Country.find(:first, :conditions => ['UPPER(name) = :name and state_id = :state_id', {:name => address.city.upcase, :state_id => address.state.id}])
        else
          false
      end
    end
  end


  def county?
    kind == 'county'
  end

  def county_ids
    if county?
      members.pluck(:zoneable_id)
    else
      []
    end
  end

  def county_ids=(ids)
    set_zone_members(ids, 'Spree::County')
  end

  # convenience method for returning the countries contained within a zone
  def country_list
    @countries ||= case kind
                     when 'country' then
                       zoneables
                     when 'state' then
                       zoneables.collect(&:country)
                     when 'county'
                       zone_member.zoneable.country_list
                     else
                       []
                   end.flatten.compact.uniq
  end


end