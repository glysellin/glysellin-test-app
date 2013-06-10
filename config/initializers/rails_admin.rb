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


  config.model "Vegetable" do
    configure :variant do
      active true
    end

    configure :product do
      active true
    end
  end

  config.model "Fruit" do
    configure :variants do
      active true
    end

    configure :product do
      active true
    end
  end

  config.model "Glysellin::Product" do
    nested do
      exclude_fields :sellable

      configure :vat_rate do
        default_value do
          Glysellin.default_vat_rate
        end
      end
    end
  end

  config.model "Glysellin::Variant" do
    nested do
      exclude_fields :sellable

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

  def parent_from bindings
    bindings[:form].parent_builder.options[:as].camelize.constantize
  end
end
