# encoding: utf-8

RestfulSync.config do |config|
  # Define the observed resources models
  config.observed_resources = [Glysellin::Product, Glysellin::Taxonomy, Glysellin::Brand]

  # Define the accessible resources models
  config.accessible_resources = [Glysellin::Order]

  # Define the targeted API URL
  config.end_point = "localhost:3000/api"
end