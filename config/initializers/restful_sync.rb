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
    config.accessible_resources = [Glysellin::Order]

    # Define the targeted API URL
    # config.end_point = "restful-sync-child.herokuapp.com/api"
    # config.end_point = "localhost:3000/api"
    config.api_token = "Ndg1GqAq2KuRncqxNGLm"

    config.override_api_controller = [User]
end