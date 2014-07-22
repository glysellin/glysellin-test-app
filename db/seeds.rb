# encoding: utf-8
require 'csv'
require 'rack'

def logging str, &block
  print "#{ str } ... "
  block.call
  puts "done"
end

# Admin user
logging "Generate default user" do
  User.create(
    email: "admin@example.com",
    password: "admin123",
    password_confirmation: "admin123"
  )
end

Rake::Task["glysellin:seed"].invoke

# Products
logging "Generate default products" do
  rows = CSV.parse File.read Rails.root.join("db", "seed-files", "products.csv")
  headers = rows.shift
  rows.each do |row|
    # Convert CSV row to rack-like request params
    request = headers.zip(row).map { |pair| pair.join("=") }.join("&")
    params = Rack::Utils.parse_nested_query(request)
    # Prepare image to be imported with paperclip
    image = nil
    if (filename = params["images_attributes"]["0"]["image"])
      image = params["images_attributes"]["0"]["image"] = File.open(
        Rails.root.join("db", "seed-files", "photos", filename)
      )
    end
    # Assign it to a new product
    product = Glysellin::Product.create! params
    # Close open image
    image.close if image
  end
end

# Example discount code
logging 'Generating default discount code : "GLYSELLIN"' do
  # Default discount type
  discount_type_id =
    Glysellin::DiscountType.find_by_identifier('order-percentage').id
  # Create code
  Glysellin::DiscountCode.create!(
    name: 'Glysellin test code',
    value: 20,
    code: 'GLYSELLIN',
    discount_type_id: discount_type_id
  )
end
