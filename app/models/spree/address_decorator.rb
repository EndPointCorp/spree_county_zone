Spree::Address.class_eval do
  belongs_to :county, class_name: "Spree::County"
end