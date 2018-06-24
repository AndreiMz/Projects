require "administrate/base_dashboard"

class BeerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beer_style: Field::BelongsTo,
    breweries: Field::HasMany,
    id: Field::Number,
    beer_name: Field::String,
    photo: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :beer_style,
    :breweries,
    :id,
    :beer_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :beer_style,
    :breweries,
    :id,
    :beer_name,
    :photo,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :beer_style,
    :breweries,
    :beer_name,
    :photo,
    :description,
  ].freeze

  # Overwrite this method to customize how beers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(beer)
  #   "Beer ##{beer.id}"
  # end
end
