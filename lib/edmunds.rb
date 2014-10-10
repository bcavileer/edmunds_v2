require 'edmunds/version'

require 'edmunds/vehicle/specification/make'
require 'edmunds/vehicle/specification/model'
require 'edmunds/vehicle/specification/model_year'
require 'edmunds/vehicle/specification/style'
require 'edmunds/vehicle/specification/engine_and_transmission'

module Edmunds
  class << self
    include Edmunds::Vehicle::Specification::Make
    include Edmunds::Vehicle::Specification::Model
    include Edmunds::Vehicle::Specification::ModelYear
    include Edmunds::Vehicle::Specification::Style
    include Edmunds::Vehicle::Specification::EngineAndTransmission

  end
end

# TODO implement these
# Edmunds::Vehicle::Specification::ColorsAndOptions
# Edmunds::Vehicle::Specification::Configuration
# Edmunds::Vehicle::Specification::Equipment
# Edmunds::Vehicle::Specification::SquishVin
# Edmunds::Vehicle::Specification::VinDecoding

# Edmunds::Vehicle::Service::Maintenance
# Edmunds::Vehicle::Service::Recalls
# Edmunds::Vehicle::Service::ServiceBulletin
# Edmunds::Vehicle::Service::Notes
# Edmunds::Vehicle::Service::LocalLaborRates

# Edmunds::Vehicle::Pricing::TrueMarketValue
# Edmunds::Vehicle::Pricing::TrueCostToOwn
# Edmunds::Vehicle::Pricing::TrueCostToOwnCategories
# Edmunds::Vehicle::Pricing::IncentivesAndRebates

# Edmunds::Vehicle::Content::LetterGradeRating
# Edmunds::Vehicle::Content::RatingsAndReviews

# Edmunds::Vehicle::Media::VehiclePhotos

# Edmunds::Editorial::Articles
# Edmunds::Editorial::EditorReviews

# Edmunds::Inventory::VinLookup
# Edmunds::Inventory::VehicleListings

# Edmunds::Dealer::RatingsAndReviews
# Edmunds::Dealer::DetailsAndLocation
