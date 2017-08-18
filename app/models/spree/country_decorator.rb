Spree::Country.class_eval do
  has_many :counties, through: :states
end