# encoding: utf-8

RestfulSync.config do |config|
    # Define the observed resources models
    config.observed_resources = [
      Glysellin::Product,
      Glysellin::ProductType, 
      Glysellin::Brand, 
      Glysellin::Order, 
      Glysellin::DiscountCode, 
      Glysellin::Taxonomy, 
      Glysellin::ShippingMethod, 
      Glysellin::PaymentMethod, 
      User
    ]

    # Define the accessible resources models
    config.accessible_resources = [Glysellin::Order, User]

    # Define the targeted API URL
    config.end_point = "restful-sync-child.herokuapp.com/api"
end