
# RailsAdmin config file. Generated on March 15, 2013 12:40
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Glysellin Test', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false
  config.excluded_models = ["RestfulSync::SyncRef"]

  [
    "DiscountType", "OrderAdjustment", "PaymentMethod", "ProductProperty",
    "ProductPropertyType", "ShippingMethod"
  ].each do |model_name|
    config.model "Glysellin::#{ model_name }" do
      visible false
    end
  end

  [
    "Glysellin::Brand", "Glysellin::DiscountCode"
  ].each do |model_name|
    config.model model_name do
      navigation_label "Shop"
    end
  end

  config.model "Glysellin::Sellable" do
    configure :vat_rate do
      default_value do
        Glysellin.default_vat_rate
      end
    end

    include_fields :name, :description, :taxonomy, :eot_price, :price, :images,
                   :unlimited_stock, :variants
  end

  config.model "Glysellin::Variant" do
    visible false

    nested do
      include_fields :sku, :name, :published, :stocks

      configure :name do
        visible do
          !parent_from(bindings).sellable_options[:simple] rescue true
        end
      end

      configure :slug do
        visible do
          false
        end
      end

      configure :unlimited_stock do
        visible do
          parent_from(bindings).sellable_options[:stock] rescue true
        end
      end

      configure :in_stock do
        visible do
          parent_from(bindings).sellable_options[:stock] rescue true
        end
      end
    end
  end

  config.model "Glysellin::Stock" do
    nested do
      include_fields :store, :count
    end
  end

  config.model "Glysellin::Image" do
    navigation_label "Shop"

    include_fields :image
  end

  config.model "Glysellin::Order" do
    navigation_label "Shop"

    object_label_method do
      :order_name
    end

    configure :state, :enum do
      enum do
        %w(ready paid shipped).map do |s|
          [I18n.t("glysellin.orders.states.#{ s }"), s]
        end
      end
    end

    configure :payment_method, :string do
      pretty_value do
        bindings[:object].payment_method.name if bindings[:object].payment_method
      end
    end

    field :ref do
      read_only true
    end

    field :total_price do
      pretty_value do
        "
        <strong>
          #{ bindings[:view] && bindings[:view].number_to_currency(value) }
        </strong>
        ".html_safe
      end
    end

    include_fields :state, :paid_on, :customer, :billing_address,
      :shipping_address, :payments, :line_items
  end

  config.model "Glysellin::Address" do
    visible false

    object_label_method do
      :address_name
    end

    include_fields :first_name, :last_name, :address, :zip, :city, :country,
      :tel
  end

  config.model "Glysellin::LineItem" do
    visible false

    field :name do
      read_only true
    end

    field :price do
      read_only true
      pretty_value do
        bindings[:view] && bindings[:view].number_to_currency(value)
      end
    end

    field :quantity do
      read_only true
    end
  end

  config.model "Glysellin::Payment" do
    visible false
    include_fields :state, :payment_method, :received_on
  end

  def order_name
    addr = self.billing_address
    "#{ self.ref } - #{ addr.first_name } #{ addr.last_name }"
  end

  def address_name
    "#{ self.first_name } #{ self.last_name } - #{ self.id }"
  end

  def parent_from bindings
    bindings[:form].parent_builder.options[:as].camelize.constantize
  end
end
