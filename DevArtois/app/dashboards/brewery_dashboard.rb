require "administrate/base_dashboard"

class BreweryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beers: Field::HasMany,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    brewery_name: Field::String,
    brewery_website: Field::String,
    brewery_full_address: Field::String,
    brewery_latitude: Field::Number.with_options(decimals: 2),
    brewery_longitude: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :beers,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :beers,
    :id,
    :created_at,
    :updated_at,
    :brewery_name,
    :brewery_website,
    :brewery_full_address,
    :brewery_latitude,
    :brewery_longitude,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :beers,
    :brewery_name,
    :brewery_website,
    :brewery_full_address,
    :brewery_latitude,
    :brewery_longitude,
  ].freeze

  # Overwrite this method to customize how breweries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(brewery)
  #   "Brewery ##{brewery.id}"
  # end
end
