class Fruit < ActiveRecord::Base
  attr_accessible :description, :name, :image

  acts_as_sellable stock: false

  has_attached_file :image,
    styles: {
      thumb: "100x100#"
    }
end
