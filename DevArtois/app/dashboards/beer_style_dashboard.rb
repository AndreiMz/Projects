require "administrate/base_dashboard"

class BeerStyleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beers: Field::HasMany,
    id: Field::Number,
    style_name: Field::String,
    description: Field::Text,
    alcohol: Field::Number.with_options(decimals: 2),
    bitterness: Field::Number,
    color: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :beers,
    :id,
    :style_name,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :beers,
    :id,
    :style_name,
    :description,
    :alcohol,
    :bitterness,
    :color,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :beers,
    :style_name,
    :description,
    :alcohol,
    :bitterness,
    :color,
  ].freeze

  # Overwrite this method to customize how beer styles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(beer_style)
  #   "BeerStyle ##{beer_style.id}"
  # end
end