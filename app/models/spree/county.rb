class Spree::County < Spree::Base
  belongs_to :state
  has_one :country, through: :state

  has_many :zone_members,
           -> { where(zoneable_type: 'Spree::State') },
           class_name: 'Spree::ZoneMember',
           dependent: :destroy,
           foreign_key: :zoneable_id

  has_many :zones, through: :zone_members, class_name: 'Spree::Zone'

  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:state_id]

  def state_and_county
    if state
      state.name + ' - ' + name
    else
      name
    end
  end

  # table of { country.id => [ state.id , state.name ] }, arrays sorted by name
  # blank is added elsewhere, if needed
  def self.county_group_by_state_id
    state_info = Hash.new { |h, k| h[k] = [] }
    self.order(:name).each { |county|
      state_info[county.state_id.to_s].push [county.id, county.name]
    }
    state_info
  end

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end

end
